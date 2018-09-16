class ApplicationController < ActionController::Base

    rescue_from CanCan::AccessDenied do |exception|
        render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    end

  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "neutro"
    else
      "application"
    end
  end

    def current_ability
        @current_ability ||= Ability.new(current_usuario)
    end

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
    def configure_permitted_parameters     
    	devise_parameter_sanitizer.permit(:sign_up) do |usuarios_params|        
      		usuarios_params.permit(:nome, :data_nascimento, :email, :sexo, :perfil, :password, :password_confirmation, :curso_atual)    
    	end

    	devise_parameter_sanitizer.permit(:account_update) do |usuarios_params|        
      		usuarios_params.permit(:nome, :data_nascimento, :email, :sexo, :perfil, :password, :password_confirmation, :current_password, :curso_atual)    
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
