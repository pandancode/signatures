class ContractsController < ApplicationController
  def index
    @contract = Contract.new
  end

  def show
    @contract = Contract.find(contract_params)
  end

  def new
    @contract = Contract.new
    @company = Company.find(params[:id])
  end

  def create
    # Double check below
    @contract = Contract.new
    @company = Company.find(params[:id])
    @contract.company = @company
    if @contract.save
      redirect_to contract_path(@contract)
    else
      render :new
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:fully_signed_at)
  end
end
