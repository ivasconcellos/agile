class SalasChatController < ApplicationController
  before_action :set_sala_chat, only: [:edit, :update, :destroy]
  before_action :authenticate_usuario!
  
  # GET /sala_chat
  # GET /sala_chat.json
  def index
    @salas_chat = SalaChat.where(curso_id: current_usuario.curso_atual_id).page(params[:page])
    authorize! :index, SalaChat
  end

  # GET /sala_chat/1
  # GET /sala_chat/1.json
  def show
    @sala_chat = SalaChat.includes(:mensagens).find_by(id: params[:id])
    @mensagem = Mensagem.new
    authorize! :show, SalaChat
  end

  # GET /sala_chat/new
  def new
    authorize! :new, SalaChat
    @sala_chat = SalaChat.new
    @sala_chat.curso_id = params[:curso_id]
  end

  # GET /sala_chat/1/edit
  def edit
    authorize! :edit, SalaChat
    authorize! :new, SalaChat
  end

  # POST /sala_chat
  # POST /sala_chat.json
  def create
    @sala_chat = SalaChat.new(sala_chat_params)
    @usuario = UsuarioCurso.select(:id).where(usuario_id: current_usuario.id, curso_id: current_usuario.curso_atual_id).first
    @sala_chat.usuario_curso_id = @usuario.id
    respond_to do |format|
      if @sala_chat.save
        format.html { redirect_to @sala_chat, notice: 'Sala de chat cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @sala_chat }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @sala_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sala_chat/1
  # PATCH/PUT /sala_chat/1.json
  def update
    respond_to do |format|
      if @sala_chat.update(sala_chat_params)
        format.html { redirect_to @sala_chat, notice: 'Sala de chat atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @sala_chat }
      else
        format.html { render :edit }
        format.json { render json: @sala_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sala_chat/1
  # DELETE /sala_chat/1.json
  def destroy
    authorize! :destroy, SalaChat
    @sala_chat.destroy
    respond_to do |format|
      format.html { redirect_to sala_chat_index_url, notice: 'Sala de chat excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sala_chat
      @sala_chat = SalaChat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sala_chat_params
      params.require(:sala_chat).permit(:nome, :curso_id, :ativo, :usuario_curso_id)
    end
end
