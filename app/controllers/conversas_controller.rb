class ConversasController < ApplicationController
  before_action :authenticate_usuario!

  def index
    @professores = UsuarioCurso.where(perfil: 'Professor', curso_id: current_usuario.curso_atual)
    @alunos = UsuarioCurso.where(perfil: 'Aluno', curso_id: current_usuario.curso_atual)
    authorize! :index, Conversa
  end

  def new
    @conversa = Conversa.new
    @conversa.destinatario_id = params[:destinatario_id]
    @conversa.conversa_id = params[:conversa_id]
    authorize! :new, Conversa
  end

  def show
    @conversa = Conversa.find(params[:id])
    authorize! :show, Conversa
  end

  def create
    @conversa = Conversa.new(conversa_params)
    @conversa.usuario_curso_id = current_usuario.id
    respond_to do |format|
      if @conversa.save
        ApplicationMailer.mensagens_professor(@conversa).deliver
        format.html { redirect_to @conversa, notice: 'Mensagem enviada com sucesso!' }
        format.json { render :show, status: :created, location: @conversa }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @conversa.errors, status: :unprocessable_entity }
      end
    end
  end

  def conversas_professor
    @conversas = Conversa.where(usuario_curso_id: current_usuario.id,
     destinatario_id: params[:professor_id]).or(Conversa.where(
      usuario_curso_id: params[:professor_id], destinatario_id: current_usuario.id)).order('created_at')
    authorize! :show, Conversa
  end
    
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def conversa_params
      params.require(:conversa).permit(:usuario_curso_id, :mensagem, :assunto, :destinatario_id, :lida, :conversa_id)
    end
end
