class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    authorize @company
  end

  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    authorize @company
    @company.user = current_user
    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
    authorize @company
  end

  def update
    @company = Company.find(params[:id])
    authorize @company
    @company.update(company_params)
    redirect_to company_path(current_user.company)
  end
  private

  def company_params
    params.require(:company).permit(:company_name, :address, :detail)
  end
end
