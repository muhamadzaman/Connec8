class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActionController::InvalidAuthenticityToken, with: :user_not_authenticated

  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_404
    redirect_to(root_path)
  end

  def record_not_found
    flash[:alert] = 'Unable to find the records.'
    redirect_to(request.referer || root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:avatar, :name, :username, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:avatar, :name, :username, :email, :password, :current_password)
    end
  end

  def user_not_authenticated
    redirect_to new_user_session_path, alert: "You need to sign in or sign up before continuing."
  end
end
