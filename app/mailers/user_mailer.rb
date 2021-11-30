class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_contract_received.subject
  #
  def new_contract_received
    @user = params[:user]
    mail(to: @user.email, subject: 'You got a new contract')
  end
end
