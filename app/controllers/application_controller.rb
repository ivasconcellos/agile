class ApplicationController < ActionController::Base
  after_action :track_action
  before_action :prepare_exception_notifier

  def authenticate_any!
    if admin_signed_in?
        true
    else
        authenticate_usuario!
    end
end
  
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

  before_action :perfil, if: :current_usuario
    def perfil
      @perfil = UsuarioCurso.where(usuario_id: current_usuario, curso_id: current_usuario.curso_atual).first
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

  def prepare_exception_notifier
    request.env["exception_notifier.exception_data"] = {
      current_usuario: current_usuario
    }
  end
  

  def current_ability
    @current_ability ||= Ability.new(current_usuario, current_admin)
  end

  before_action :check_concurrent_session

  def check_concurrent_session
    if is_already_logged_in?
      sign_out_and_redirect(current_usuario)
    end
  end
  
  def is_already_logged_in?
    current_usuario && !(session[:token] == current_usuario.login_token)
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

  def track_action
    ahoy.authenticate(current_usuario) if current_usuario
    Ahoy.user_method = :current_usuario
    
    ahoy.track "Ran action", request.path_parameters

  end

end
