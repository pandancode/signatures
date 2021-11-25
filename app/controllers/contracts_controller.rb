require 'hexapdf'
class ContractsController < ApplicationController
  # def index
  #   @user = current_user
  #   @contracts = Contract.where(company_id:@user)
  #   # @contract = Contract.all.where(fully_signed_at: nil)
  # end

  # def show
  #   @contract = Contract.find(contract_params)
  # end

  def new
    @company = Company.find(params[:company_id])
    @contract = Contract.new
  end

  def create
    doc = HexaPDF::Document.new
    page = doc.pages.add
    canvas = page.canvas
    canvas.font('Helvetica', size: 50).fill_color(0, 128, 255)
    canvas.text("Hello World", at: [150, 396])
    doc.write("hello-world.pdf")
    # Double check below
    # @contract = Contract.new
    # @company = Company.find(params[:company_id])
    # @contract.company = @company
    # if @contract.save
    #   redirect_to company_path(@company)
    # else
    #   render :new
    # end
  end

  private

  def contract_params
    params.require(:contract).permit(:fully_signed_at)
  end
end
