class SignatoriesController < ApplicationController
  def show
    @signatory = Signatory.find(signatory_params)
  end

  def new
    @contract = Contract.find(params[:id])
    # TO CHECK BELOW
    @individual = Individual.find(params[:id])
    @signatory = Signatory.new
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
