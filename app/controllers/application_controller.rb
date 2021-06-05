class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :full_name, :gender, :birth_day, :introduce, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:introduce, :image])
  end
end
