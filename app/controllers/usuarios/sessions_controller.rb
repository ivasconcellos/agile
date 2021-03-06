# frozen_string_literal: true

class Usuarios::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :check_concurrent_session

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in

  def create
    super
    if current_visit
      current_visit.started_at = Time.now
      current_visit.usuario_id = current_usuario.id
      current_visit.save
    end
    
    Ahoy.user_method = :current_usuario
    ahoy.authenticate(current_usuario)
    set_login_token
  end
  # DELETE /resource/sign_out
  def destroy
    current_visit.finished_at = Time.now
    current_visit.save
    ahoy.reset()
    super
  end
  
  private
  def set_login_token
    token = Devise.friendly_token
    session[:token] = token
    current_usuario.login_token = token
    current_usuario.save
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
