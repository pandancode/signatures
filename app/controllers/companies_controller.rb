class CompaniesController < ApplicationController
  def show
    @company = Company.find(current_user.id)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      redirect_to company_path(current_user)
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:company_name, :address, :detail)
  end
end
