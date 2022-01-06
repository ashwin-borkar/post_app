class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?
	def authenticate_user
	  if session[:user_id]
	    @current_user = User.find session[:user_id] 
	    return true 
	  else
	    redirect_to(:controller => 'sessions', :action => 'login')
	    return false
	  end
	end
	protected

  def configure_permitted_parameters
      # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password) }
    devise_parameter_sanitizer.permit(:sign_up, keys: [:emal, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :current_password, :username])

      # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password, :is_female, :city, :state, :country, :phone, :avatar) }
    end
end
