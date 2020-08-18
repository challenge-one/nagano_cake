class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
    case resource
  		when Admin
    	admin_path
  		when Customer
    	root_path
        end
    end
    def after_sign_out_path_for(resource_or_scope)
	    if resource_or_scope == :admin_user
	      admin_session_path
	    else
	      admin_session_path
	    end
	end
end
