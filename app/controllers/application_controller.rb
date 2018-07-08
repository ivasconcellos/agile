class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
    def configure_permitted_parameters     
    	devise_parameter_sanitizer.permit(:sign_up) do |usuarios_params|        
      		usuarios_params.permit(:nome, :data_nascimento, :email, :sexo, :perfil, :password, :password_confirmation)    
    	end  
    end

    def after_sign_in_path_for(resource)
	    if resource_name == :usuario
	 		"/inicial"
	    elsif  resource_name == :admin
	 	 	"/administration"
	    end
    end


end
