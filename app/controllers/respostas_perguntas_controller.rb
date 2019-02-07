class RespostasPerguntasController < ApplicationController
  before_action :set_resposta_pergunta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /respostas_perguntas/1
  # GET /respostas_perguntas/1.json
  def show
  end

  # GET /respostas_perguntas/new
  def new
    @resposta_pergunta = RespostaPergunta.new
    @resposta_pergunta.pergunta_quiz_id = params[:pergunta_quiz_id]
    authorize! :new, RespostaPergunta
  end

  # GET /respostas_perguntas/1/edit
  def edit
    authorize! :edit, RespostaPergunta
  end

  # POST /respostas_perguntas
  # POST /respostas_perguntas.json
  def create
    @resposta_pergunta = RespostaPergunta.new(resposta_pergunta_params)
    if @resposta_pergunta.save
      @respostas_perguntas = RespostaPergunta.where(pergunta_quiz_id: @resposta_pergunta.pergunta_quiz_id)
    end
  end

  # PATCH/PUT /respostas_perguntas/1
  # PATCH/PUT /respostas_perguntas/1.json
  def update
    respond_to do |format|
      if @resposta_pergunta.update(resposta_pergunta_params)
        format.html { redirect_to @resposta_pergunta, notice: 'Resposta pergunta was successfully updated.' }
        format.json { render :show, status: :ok, location: @resposta_pergunta }
      else
        format.html { render :edit }
        format.json { render json: @resposta_pergunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respostas_perguntas/1
  # DELETE /respostas_perguntas/1.json
  def destroy
    authorize! :destroy, RespostaPergunta

    @pergunta_quiz = @resposta_pergunta.pergunta_quiz_id
    @resposta_pergunta.destroy
    if @resposta_pergunta.destroy
       @respostas_perguntas = RespostaPergunta.where(pergunta_quiz_id: @pergunta_quiz)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resposta_pergunta
      @resposta_pergunta = RespostaPergunta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resposta_pergunta_params
      params.require(:resposta_pergunta).permit(:pergunta_quiz_id, :descricao, :comentario, :correta)
    end
end
