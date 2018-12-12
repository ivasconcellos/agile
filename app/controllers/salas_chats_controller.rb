class SalasChatsController < ApplicationController
  before_action :set_sala_chat, only: [:show, :edit, :update, :destroy]

  # GET /salas_chats
  # GET /salas_chats.json
  def index
    @salas_chats = SalaChat.all
  end

  # GET /salas_chats/1
  # GET /salas_chats/1.json
  def show
  end

  # GET /salas_chats/new
  def new
    @sala_chat = SalaChat.new
  end

  # GET /salas_chats/1/edit
  def edit
  end

  # POST /salas_chats
  # POST /salas_chats.json
  def create
    @sala_chat = SalaChat.new(sala_chat_params)

    respond_to do |format|
      if @sala_chat.save
        format.html { redirect_to @sala_chat, notice: 'Sala chat was successfully created.' }
        format.json { render :show, status: :created, location: @sala_chat }
      else
        format.html { render :new }
        format.json { render json: @sala_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salas_chats/1
  # PATCH/PUT /salas_chats/1.json
  def update
    respond_to do |format|
      if @sala_chat.update(sala_chat_params)
        format.html { redirect_to @sala_chat, notice: 'Sala chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @sala_chat }
      else
        format.html { render :edit }
        format.json { render json: @sala_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salas_chats/1
  # DELETE /salas_chats/1.json
  def destroy
    @sala_chat.destroy
    respond_to do |format|
      format.html { redirect_to salas_chats_url, notice: 'Sala chat was successfully destroyed.' }
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
      params.require(:sala_chat).permit(:nome, :usuario_id, :curso_id)
    end
end
