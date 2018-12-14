class SalasChatsController < ApplicationController
  before_action :set_sala_chat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /salas_chats
  # GET /salas_chats.json
  def index
    @salas_chats = SalaChat.where(curso_id: current_usuario.curso_atual_id).page(params[:page])
    authorize! :index, @salas_chats
  end

  # GET /salas_chats/1
  # GET /salas_chats/1.json
  def show
    authorize! :show, @sala_chat
  end

  # GET /salas_chats/new
  def new
    @sala_chat = SalaChat.new
    @sala_chat.curso_id = params[:curso_id]
    authorize! :new, @sala_chat
  end

  # GET /salas_chats/1/edit
  def edit
    authorize! :edit, @sala_chat
  end

  # POST /salas_chats
  # POST /salas_chats.json
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

  # PATCH/PUT /salas_chats/1
  # PATCH/PUT /salas_chats/1.json
  def update
    respond_to do |format|
      if @sala_chat.update(sala_chat_params)
        format.html { redirect_to @sala_chat, notice: 'Sala de chat atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @sala_chat }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @sala_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salas_chats/1
  # DELETE /salas_chats/1.json
  def destroy
    authorize! :destroy, @sala_chat
    @sala_chat.destroy
    respond_to do |format|
      format.html { redirect_to salas_chats_url, notice: 'Sala de chat excluída com sucesso!' }
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
      params.require(:sala_chat).permit(:nome, :usuario_curso_id, :curso_id, :ativo)
    end
end
