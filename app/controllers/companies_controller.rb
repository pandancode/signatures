class CompaniesController < ApplicationController

  def show
    
  end

  def new
    @user = current_user
    @company = Company.new(company_params)
    @company.user = @user
    
    @company.save
  end

  def create
    @
  end

  private

  def company_params
    params.require(:company).permit(:company_name, :address, :detail)
  end
end
