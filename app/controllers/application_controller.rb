class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])

    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  protected

  def after_sign_in_path_for(user)
    if user.role == "Individual"
      individual_path(user.individual)
    else
      company_path(user.company)
    end
  end
end
