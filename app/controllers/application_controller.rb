class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_admin
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    photos_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :admin])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :current_password, :admin])
  end
end
