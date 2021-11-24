class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
    user.role == "Individual" ? new_individual_path : new_company_path
  end
end
