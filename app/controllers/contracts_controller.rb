class ContractsController < ApplicationController
  # def index
  #   # sql_query = "name ILIKE :query OR description ILIKE  :query"

  #   case current_user.role
  #   when "Company"
  #     @user = current_user.company
  #     if params[:query].present?
  #       @contracts = Contract.where(company_id: @user).order("updated_at DESC").search_by_name_and_description(params[:query])
  #     else
  #       @contracts = Contract.where(company_id: @user).order("updated_at DESC")
  #     end
  #   when "Individual"
  #     @user = current_user.individual
  #     if params[:query].present?
  #       @contracts = Contract.where(individual_id: @user).order("updated_at DESC").search_by_name_and_description(params[:query])
  #     else
  #       @contracts = Contract.where(individual_id: @user).order("updated_at DESC")
  #     end
  #   end
  # end

  def show
    @contract = Contract.find(params[:id])
    authorize @contract
    if current_user.role == "Individual" && current_user.individual == @contract.individual && @contract.fully_signed_at.nil? && @contract.status == "unopened"
      @contract.status = "opened"
      @contract.save
    end
  end

  def new
    @company = current_user.company if current_user.role == "Company"
    @contract = Contract.new
    authorize @contract
  end

  def create
    @contract = Contract.new(new_contract_params)
    @company = current_user.company
    @contract.company = @company
    authorize @contract
    @target_email = new_contract_params[:recipient_email]
    @user = User.where(email: @target_email)

    # Below handles whether the email could be matched
    if @user == []
      new_user = User.new(email: @target_email, password: "111111", role: "Individual")
      @individual = Individual.new(title: new_contract_params[:title], first_name: new_contract_params[:first_name], last_name: new_contract_params[:last_name], user: new_user)
      new_user.save
      @individual.save
      @contract.individual_id = @individual.id
    else
      # This presumes that the recipient email is in our database, else, we will still have to create one (which would conflict with our validations but whatever)
      # The below kind of works but I want to go to the next level faster
      # Note the below technically returns an array, which is why we need the [0]
      @individual = Individual.where(user_id: User.where(email: @target_email))[0]
      @contract.individual_id = @individual.id
    end

    if @contract.save
      redirect_to contract_path(@contract), flash: { success: "Contract has been successfully created" }
      mail = UserMailer.with(user: @individual.user).new_contract_received(@contract)
      mail.deliver_now
    else
      render :new
    end
  end

  # I don't think edit and update is technically used. Yilun removed routes too
  def edit
    @contract = Contract.find(params[:id])
    authorize @contract
  end

  def update
    @contract = Contract.find(params[:id])
    @contract.fully_signed_at = Time.now
    @contract.status = "signed"
    @contract.save!
    redirect_to contract_path(@contract)
  end

  def sign
    # Updating contract
    @contract = Contract.find(params[:id])
    authorize @contract
    # Renders the initials of the user (only, for now)
    initialed_page = WickedPdf.new.pdf_from_string(render_to_string('pdf_initials/show', layout: "pdf", locals: { individual: current_user.individual }))
    initials = ::CombinePDF.new
    initials << ::CombinePDF.parse(initialed_page)
    initials = initials.pages[0]
    # initials = CombinePDF.load(initialed_page) # THIS DOES NOT WORK

    # Renders the signature page
    signature_pdf = WickedPdf.new.pdf_from_string(render_to_string('pdf_signatures/show', layout: "pdf", locals: { individual: current_user.individual }))

    contract = @contract.document.download

    pdf = ::CombinePDF.new
    pdf << ::CombinePDF.parse(contract)
    pdf << ::CombinePDF.parse(signature_pdf)
    # pdf << ::CombinePDF.parse(initialed_page) # THIS IS FOR TESTING IF initialed_page gets appended like the sig page. Answer: yes
    pdf.pages.each { |page| page << initials }

    @contract.document.attach(io: StringIO.new(pdf.to_pdf), filename: "signed_contract.pdf")
    @contract.update(status: "signed", fully_signed_at: Time.current)
    redirect_to contract_path(@contract), flash: { success: "Contract has been successfully created" }
  end

  def signed
    sql_query = "name ILIKE :query OR description ILIKE :query"
    case current_user.role
    when "Company"
      @user = current_user.company
      if params[:query].present?
        @contracts = Contract.where(sql_query, query: "%#{params[:query]}%").where(status: "signed").where(company_id: @user).order("updated_at DESC")
      else
        @contracts = Contract.where(status: "signed").where(company_id: @user).order("updated_at DESC")
      end
    when "Individual"
      @user = current_user.individual
      if params[:query].present?
        @contracts = Contract.where(sql_query, query: "%#{params[:query]}%").where(status: "signed").where(individual_id: @user).order("updated_at DESC")
      else
        @contracts = Contract.where(status: "signed").where(individual_id: @user).order("updated_at DESC")
      end
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'contracts/contracts.html', locals: { contract: @contracts } }
    end
    # @user = current_user.individual
    # @contracts = Contract.where(individual_id: @user)
    authorize @contracts
  end

  def unsigned
    sql_query = "name ILIKE :query OR description ILIKE :query"
    case current_user.role
    when "Company"
      @user = current_user.company
      if params[:query].present?
        @contracts = Contract.where(sql_query, query: "%#{params[:query]}%").where(fully_signed_at: nil).where(company_id: @user).order("updated_at ASC")
      else
        @contracts = Contract.where(fully_signed_at: nil).where(company_id: @user).order("updated_at ASC")
      end
    when "Individual"
      @user = current_user.individual
      if params[:query].present?
        @contracts = Contract.where(sql_query, query: "%#{params[:query]}%").where(fully_signed_at: nil).where(individual_id: @user).order("updated_at ASC")
      else
        @contracts = Contract.where(fully_signed_at: nil).where(individual_id: @user).order("updated_at ASC")
      end
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'contracts/contracts.html', locals: { contract: @contracts } }
    end
    # @user = current_user.individual
    # @contracts = Contract.where(individual_id: @user)
    authorize @contracts
  end

  private

  def new_contract_params
    params.require(:contract).permit(:name, :description, :recipient_email, :document, :title, :first_name, :last_name)
  end
end
