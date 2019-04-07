# frozen_string_literal: true

class Usuarios::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

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
  end
  # DELETE /resource/sign_out
  def destroy
    current_visit.tempo_sessao = (Time.now - current_visit.started_at)/1.minute
    @visitas = Ahoy::Visit.where(usuario_id: current_usuario.id).sum('tempo_sessao')
    current_visit.tempo_logado = @visitas
    current_visit.save
    ahoy.reset()
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
