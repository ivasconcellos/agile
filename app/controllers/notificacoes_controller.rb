class NotificacoesController < ApplicationController
  before_action :authenticate_usuario!

  # GET /notificacoes
  # GET /notificacoes.json
  def index
    authorize! :index, Notificacao
    @notificacoes = Notificacao.where(usuario_curso: @perfil.id).order('id desc').page(params[:page])
  end

  # GET /notificacoes/1
  # GET /notificacoes/1.json
  def show
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def notificacao_params
      params.require(:notificacao).permit(:usuario_curso_id, :texto, :tipo)
    end
end
