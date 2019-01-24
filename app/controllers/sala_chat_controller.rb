class SalaChatController < ApplicationController
  before_action :set_sala_chat, only: [:edit, :update, :destroy]

  # GET /sala_chat
  # GET /sala_chat.json
  def index
    @sala_chat = SalaChat.all
  end

  # GET /sala_chat/1
  # GET /sala_chat/1.json
  def show
    @sala_chat = SalaChat.includes(:mensagens).find_by(id: params[:id])
    @mensagem = Mensagem.new
  end

  # GET /sala_chat/new
  def new
    @sala_chat = SalaChat.new
  end

  # GET /sala_chat/1/edit
  def edit
  end

  # POST /sala_chat
  # POST /sala_chat.json
  def create
    @sala_chat = current_usuario.sala_chat.build(sala_chat_params)
    if @sala_chat.save
      flash[:success] = 'Chat criado com sucesso!'
      redirect_to sala_chat_path (@sala_chat)
    else
      render 'new'
    end
  end

  # PATCH/PUT /sala_chat/1
  # PATCH/PUT /sala_chat/1.json
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

  # DELETE /sala_chat/1
  # DELETE /sala_chat/1.json
  def destroy
    @sala_chat.destroy
    respond_to do |format|
      format.html { redirect_to sala_chat_index_url, notice: 'Sala chat was successfully destroyed.' }
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
      params.require(:sala_chat).permit(:nome)
    end
end
