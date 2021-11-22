class ContractsController < ApplicationController
  def index
    @contract = Contract.new
  end

  def show
    @contract = Contract.find(contract_params)
  end

  def new
    # To complete
  end

  def create
    # To complete
  end

  private

  def contract_params
	  params.require(:contract).permit(:fully_signed_at)
  end
end
