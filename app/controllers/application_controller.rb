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

  
  before_action :perfil, if: :authenticate_usuario!
  def perfil
    @perfil = UsuarioCurso.where(usuario_id: current_usuario, curso_id: current_usuario.curso_atual).first
  end  

  def current_ability
    @current_ability ||= Ability.new(current_usuario)
  end

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
    def configure_permitted_parameters     
    	devise_parameter_sanitizer.permit(:sign_up) do |usuarios_params|        
      		usuarios_params.permit(:nome, :data_nascimento, :email, :sexo, :perfil, :password, :password_confirmation, :curso_atual, :termo_compromisso, :cpf)    
    	end

    	devise_parameter_sanitizer.permit(:account_update) do |usuarios_params|        
      		usuarios_params.permit(:nome, :data_nascimento, :email, :sexo, :perfil, :password, :password_confirmation, :current_password, :curso_atual, :cpf)    
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
