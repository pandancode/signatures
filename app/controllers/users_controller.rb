class UsersController < ApplicationController
  def new
    @user.new
  end

  def create
    @user = User.new(review_params)
    if @user.role == "Individual"
      @user.save
      redirect_to new_individual_path
    elsif @user.role == "Company"
      @user.save
      redirect_to new_company_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:user).permit(:role, :first_name, :last_name)
  end
end
