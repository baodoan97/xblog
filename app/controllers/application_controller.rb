class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_user
		if !user_signed_in?
			flash[:danger] ="You must be logged in to perform that action"
			redirect_to root_path
		end
	end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :gender, :first_name, :last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :gender, :first_name, :last_name, :password_confirmation, :current_password])
    end

end
