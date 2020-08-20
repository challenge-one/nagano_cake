class ApplicationController < ActionController::Base
	#before_action :authenticate_customer!
	#before_action :authenticate_admin!

	def after_sign_in_path_for(resource)
    case resource
  		when Admin
    	admin_path
  		when Customer
    	public_products_path
        end
    end

    def after_sign_out_path_for(resource_or_scope)
	    if resource_or_scope == :admin
	      new_admin_session_path
	    else
	      new_customer_session_path
	    end
	end

	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_rubi, :first_rubi, :email, :postcode, :address, :tell])
    	devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  	end
end
