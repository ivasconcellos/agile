class PerguntasQuizController < ApplicationController
  before_action :set_pergunta_quiz, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /perguntas_quiz/1
  # GET /perguntas_quiz/1.json
  def show
    authorize! :show, PerguntaQuiz
    @respostas_perguntas = RespostaPergunta.where(pergunta_quiz_id: @pergunta_quiz)
  end

  # GET /perguntas_quiz/new
  def new
    @pergunta_quiz = PerguntaQuiz.new
    @pergunta_quiz.quiz_id = params[:quiz_id]
    authorize! :new, PerguntaQuiz
  end

  # GET /perguntas_quiz/1/edit
  def edit
    authorize! :edit, PerguntaQuiz
  end

  # POST /perguntas_quiz
  # POST /perguntas_quiz.json
  def create
    @pergunta_quiz = PerguntaQuiz.new(pergunta_quiz_params)

    if @pergunta_quiz.save
      @perguntas_quizes = PerguntaQuiz.where(quiz_id: @pergunta_quiz.quiz_id)
    end
  end

  # PATCH/PUT /perguntas_quiz/1
  # PATCH/PUT /perguntas_quiz/1.json
  def update
    if @pergunta_quiz.update(pergunta_quiz_params)
      @perguntas_quizes = PerguntaQuiz.where(quiz_id: @pergunta_quiz.quiz_id)
     end
  end

  # DELETE /perguntas_quiz/1
  # DELETE /perguntas_quiz/1.json
  def destroy
    authorize! :destroy, PerguntaQuiz
    @quiz = @pergunta_quiz.quiz_id

    if @pergunta_quiz.destroy
      @perguntas_quizes = PerguntaQuiz.where(quiz_id: @pergunta_quiz.quiz_id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pergunta_quiz
      @pergunta_quiz = PerguntaQuiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pergunta_quiz_params
      params.require(:pergunta_quiz).permit(:quiz_id, :descricao, :pontuacao)
    end
end
