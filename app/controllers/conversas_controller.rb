class ConversasController < ApplicationController
    before_action :authenticate_usuario!
  
    def index
      authorize! :index, Conversa
      @professores = UsuarioCurso.where(perfil: 'Professor', curso_id: current_usuario.curso_atual)
      @alunos = UsuarioCurso.where(perfil: 'Aluno', curso_id: current_usuario.curso_atual)
    end
  
    def new
      authorize! :new, Conversa
      @conversa = Conversa.new
      @conversa.destinatario_id = params[:destinatario_id]
      @conversa.conversa_id = params[:id]
      if params[:conversa_id]
        @inicial = Conversa.find_by(id: params[:conversa_id])
        @conversa.conversa_id = @inicial.id
        @conversa.assunto = @inicial.assunto
      end
    end
  
    def show
      authorize! :show, Conversa
      @conversa = Conversa.find(params[:id])
    end
  
    def create
      @conversa = Conversa.new(conversa_params)
      @conversa.usuario_curso_id = @perfil.id
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
  
    def conversas_assunto
      @conversas = Conversa.where(usuario_curso_id: @perfil.id,
       destinatario_id: params[:pessoa_id]).or(Conversa.where(
        usuario_curso_id: params[:pessoa_id], destinatario_id: @perfil.id))
      @conversas = @conversas.select(:assunto).group('assunto')
      @destinatario = UsuarioCurso.find(params[:pessoa_id])
       authorize! :show, Conversa
    end
  
    def conversas_professor
      @destinatario = UsuarioCurso.find(params[:pessoa_id])
      @conversas = Conversa.where(assunto: params[:assunto], 
        usuario_curso_id: @perfil.id, destinatario_id: params[:pessoa_id]
      ).or(Conversa.where(assunto: params[:assunto],
        destinatario_id: @perfil.id, usuario_curso_id: params[:pessoa_id])).order('updated_at desc')
      
      conversas_nao_visualizadas = Conversa.select(:id).where(lida: false, destinatario_id: @perfil.id)
      lida = @conversas.where(destinatario_id: @perfil.id, id: conversas_nao_visualizadas).update_all(lida: true)
      authorize! :show, Conversa
    end
      
    private
      # Never trust parameters from the scary internet, only allow the white list through.
      def conversa_params
        params.require(:conversa).permit(:usuario_curso_id, :mensagem, :assunto, :destinatario_id, :lida, :conversa_id)
      end
  end
  