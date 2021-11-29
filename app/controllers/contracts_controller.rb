class ContractsController < ApplicationController
  # def index
  #   # sql_query = "name @@ :query OR description @@  :query"

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
    if current_user.role == "Individual" && current_user.individual == @contract.individual && @contract.fully_signed_at.nil? && @contract.status == "unopened"
      @contract.status = "opened"
      @contract.save
    end
  end

  def new
    @company = current_user.company if current_user.role == "Company"
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(new_contract_params)
    @company = current_user.company
    @contract.company = @company
    # This presumes that the recipient email is in our database, else, we will still have to create one (which would conflict with our validations but whatever)
    # The below kind of works but I want to go to the next level faster
    @user = User.where(email: new_contract_params[:recipient_email])
    # Note the below technically returns an array, which is why we need the [0]
    @individual = Individual.where(user_id: User.where(email: new_contract_params[:recipient_email]))[0]
    @contract.individual_id = @individual.id
    if @contract.save
      redirect_to unsigned_path
    else
      render :new
    end
  end

  def edit
    @contract = Contract.find(params[:id])
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
    signature_pdf = WickedPdf.new.pdf_from_string(render_to_string('pdf_signatures/show', layout: "pdf", locals: { individual: current_user.individual }))
    contract = @contract.document.download

    pdf = ::CombinePDF.new
    pdf << ::CombinePDF.parse(contract)
    pdf << ::CombinePDF.parse(signature_pdf)

    @contract.document.attach(io: StringIO.new(pdf.to_pdf), filename: "signed_contract.pdf")
    @contract.update(status: "signed", fully_signed_at: Time.current)
    redirect_to contract_path(@contract)
  end

  def signed
    case current_user.role
    when "Company"
      @user = current_user.company
      if params[:query].present?
        @contracts = Contract.where(sql_query, query: "%#{params[:query]}%").where(company_id: @user).order("updated_at DESC")
      else
        @contracts = Contract.where(company_id: @user).order("updated_at DESC")
      end
    when "Individual"
      @user = current_user.individual
      if params[:query].present?
        @contracts = Contract.where(sql_query, query: "%#{params[:query]}%").where(individual_id: @user).order("updated_at DESC")
      else
        @contracts = Contract.where(individual_id: @user).order("updated_at DESC")
      end
    end

    # @user = current_user.individual
    # @contracts = Contract.where(individual_id: @user)
  end

  def unsigned
        case current_user.role
    when "Company"
      @user = current_user.company
      if params[:query].present?
        @contracts = Contract.where(sql_query, query: "%#{params[:query]}%").where(company_id: @user).order("updated_at DESC")
      else
        @contracts = Contract.where(company_id: @user).order("updated_at DESC")
      end
    when "Individual"
      @user = current_user.individual
      if params[:query].present?
        @contracts = Contract.where(sql_query, query: "%#{params[:query]}%").where(individual_id: @user).order("updated_at DESC")
      else
        @contracts = Contract.where(individual_id: @user).order("updated_at DESC")
      end
    end
    # @user = current_user.individual
    # @contracts = Contract.where(individual_id: @user)
  end

  private

  def new_contract_params
    params.require(:contract).permit(:name, :description, :recipient_email, :document)
  end
end
