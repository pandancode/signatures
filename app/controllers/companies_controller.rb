class CompaniesController < ApplicationController

  def show
    @company.user = current_user
  end

  def new
    @user = current_user
    @company.user = @user
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)    
    if @company.save

          
    else
      
    end
    
  end

  private

  def company_params
    params.require(:company).permit(:company_name, :address, :detail)
  end
end
