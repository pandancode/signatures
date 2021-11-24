class SignatoriesController < ApplicationController
  def show
    # DONE
    @signatory = Signatory.find(params[:id])
  end

  def new
    # DONE
    @signatory = Signatory.new
    @contract = Contract.find(params[:id])
    @signatory.contract = @contract
    @signatory.individual = current_user
  end

  def create
    # Double check below
    @signatory = Signatory.new
    @contract = Contract.find(params[:contract_id])
    @individual = Individual.find(params[:individual_id])
    @signatory.contract = @contract
    @signatory.individual = @individual
    if @signatory.save
      redirect_to contract_path(@contract)
    else
      render :new
    end
  end

  def edit
    @signatory = Signatory.find(params[:id])
  end

  def update
    @signatory = Signatory.find(params[:id])
    @signatory.update(signatory_params)
    # Double check below
    redirect_to signatory_path(@signatory)
  end

  private

  def signatory_params
    params.require(:signatory).permit(:signing_status)
  end
end
