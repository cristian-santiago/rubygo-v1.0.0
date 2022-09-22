class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
    #before_action :authenticate_user!
    
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:username, :name, :email, :password, :password_confirmation, :avatar])
    devise_parameter_sanitizer.permit(:sign_in,
      keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
      keys: [:username, :name, :email, :password_confirmation, :current_password, :avatar])
  end

  #@user.avatar.attach(params[:avatar])
  
end
