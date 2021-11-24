class CompaniesController < ApplicationController

  def show
    # set user id
   @user = current_user
    #find the company through current_user id
    # @company= Company.find(params[:id])
    @company= Company.find_by(user_id: @user.id)
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

  private

  def company_params
    params.require(:company).permit(:company_name, :address, :detail)
  end
end
