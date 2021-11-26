class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  # private

  # def user_params
  #   params.require(:user).permit(:email, :role, :id)
  # end
end
