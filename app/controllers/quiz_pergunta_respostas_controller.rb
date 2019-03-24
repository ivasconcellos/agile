class QuizPerguntaRespostasController < ApplicationController
  before_action :set_quiz_pergunta_resposta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /respostas_perguntas/1
  # GET /respostas_perguntas/1.json
  def show
    authorize! :show, QuizPerguntaResposta
  end

  # GET /respostas_perguntas/new
  def new
    authorize! :new, QuizPerguntaResposta
    @quiz_pergunta_resposta = QuizPerguntaResposta.new
    @quiz_pergunta_resposta.quiz_pergunta_id = params[:quiz_pergunta_id]
  end

  # GET /respostas_perguntas/1/edit
  def edit
    authorize! :edit, QuizPerguntaResposta
  end

  # POST /respostas_perguntas
  # POST /respostas_perguntas.json
  def create
    @quiz_pergunta_resposta = QuizPerguntaResposta.new(quiz_pergunta_resposta_params)
    if @quiz_pergunta_resposta.save
      @quiz_pergunta_respostas = QuizPerguntaResposta.where(quiz_pergunta_id: @quiz_pergunta_resposta.quiz_pergunta_id)
    else
      respond_to do |format|
        format.js { render :new }
        format.json { render json: @quiz_pergunta_resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /respostas_perguntas/1
  # PATCH/PUT /respostas_perguntas/1.json
  def update
    if @quiz_pergunta_resposta.update(quiz_pergunta_resposta_params)
      @quiz_pergunta_respostas = QuizPerguntaResposta.where(quiz_pergunta_id: @quiz_pergunta_resposta.quiz_pergunta_id).order('created_at')
    else
      respond_to do |format|
        format.js { render :edit }
        format.json { render json: @quiz_pergunta_resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respostas_perguntas/1
  # DELETE /respostas_perguntas/1.json
  def destroy
    authorize! :destroy, QuizPerguntaResposta

    @quiz_pergunta = @quiz_pergunta_resposta.quiz_pergunta_id
    @quiz_pergunta_resposta.destroy
    if @quiz_pergunta_resposta.destroy
      @quiz_pergunta_respostas = QuizPerguntaResposta.where(quiz_pergunta_id: @quiz_pergunta).order('created_at')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_pergunta_resposta
      @quiz_pergunta_resposta = QuizPerguntaResposta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_pergunta_resposta_params
      params.require(:quiz_pergunta_resposta).permit(:quiz_pergunta_id, :descricao, :comentario, :correta)
    end
end
