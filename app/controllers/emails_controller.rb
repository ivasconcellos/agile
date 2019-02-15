class EmailsController < ApplicationController
  before_action :authenticate_usuario!

  # GET /emails
  # GET /emails.json
  def index
    @professores = UsuarioCurso.where(perfil: 'Professor', curso_id: current_usuario.curso_atual)
    authorize! :index, Email
  end

  # GET /emails/1
  # GET /emails/1.json
  def emails_professor
    @emails = Email.where(usuario_curso_id: current_usuario.id, destinatario_id: params[:professor_id])
    authorize! :show, Email
  end

  # GET /emails/new
  def new
    @email = Email.new
    @email.destinatario_id = params[:professor_id]
    authorize! :new, Email
  end

  def show
    @email = Email.find(params[:id])
    authorize! :show, Email
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(email_params)
    @email.usuario_curso_id = current_usuario.id
    respond_to do |format|
      if @email.save
        ApplicationMailer.mensagens_professor(@email).deliver
        format.html { redirect_to @email, notice: 'E-mail enviado com sucesso!' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:usuario_curso_id, :mensagem, :assunto, :destinatario_id)
    end
end
