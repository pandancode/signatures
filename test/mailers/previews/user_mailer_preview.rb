# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_contract_received
  def new_contract_received
    user = User.first

    UserMailer.with(user: user).new_contract_received
  end

end
