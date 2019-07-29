class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    
   
	

   protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :name])
	end
    
	rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = "Access denied."
		redirect_to root_url
	end

	
	 



end
