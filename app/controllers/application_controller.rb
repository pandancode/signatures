class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Docs for the are below
  # https://martinezjf2.medium.com/how-to-integrate-flash-messages-in-rails-11ac8824980
  add_flash_types :danger, :warning, :success, :messages

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])

    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  protected

  def after_sign_in_path_for(user)
    unsigned_path
  end
end
