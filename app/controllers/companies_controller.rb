class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    
  end

  private

  def pokemon_params
    params.require(:company).permit(:company_name, :address, :detail, :user)
  end
end
