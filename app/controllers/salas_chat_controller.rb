class SalasChatController < ApplicationController
  before_action :set_sala_chat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  
  # GET /sala_chat
  # GET /sala_chat.json
  def index
    authorize! :index, SalaChat
    @salas_chat = SalaChat.where(curso_id: @perfil.curso_id).page(params[:page])
  end

  # GET /sala_chat/1
  # GET /sala_chat/1.json
  def show
    authorize! :show, SalaChat
    if @perfil.perfil == 'Professor' or @sala_chat.usuario_curso.perfil == 'Professor' or @perfil.grupo_curso_id == @sala_chat.usuario_curso.grupo_curso_id
      @sala_chat = SalaChat.includes(:mensagens).find_by(id: params[:id])
      @mensagem = Mensagem.new
    else
      respond_to do |format|
        format.html { redirect_to salas_chat_url, alert: 'Você não está autorizado essa acessar essa Sala de Chat!' }
        format.json { head :no_content }
      end
    end

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
  end

  # POST /sala_chat
  # POST /sala_chat.json
  def create
    @sala_chat = SalaChat.new(sala_chat_params)
    @sala_chat.usuario_curso_id = @perfil.id
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
    
    respond_to do |format|
      if @sala_chat.destroy
        format.html { redirect_to salas_chat_url, notice: 'Sala de chat excluída com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to salas_chat_url, alert: 'A Sala de chat não pôde ser excluída, pois está sendo utilizada!' }
        format.json { head :no_content }
      end
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
