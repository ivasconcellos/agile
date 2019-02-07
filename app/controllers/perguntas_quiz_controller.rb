class PerguntasQuizController < ApplicationController
  before_action :set_pergunta_quiz, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /perguntas_quiz
  # GET /perguntas_quiz.json
  def index
    @perguntas_quiz = PerguntaQuiz.all
    authorize! :read, PerguntaQuiz
  end

  # GET /perguntas_quiz/1
  # GET /perguntas_quiz/1.json
  def show
    authorize! :show, PerguntaQuiz
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

    respond_to do |format|
      if @pergunta_quiz.save
        format.html { redirect_to @pergunta_quiz, notice: 'Pergunta do quiz cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @pergunta_quiz }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @pergunta_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perguntas_quiz/1
  # PATCH/PUT /perguntas_quiz/1.json
  def update
    respond_to do |format|
      if @pergunta_quiz.update(pergunta_quiz_params)
        format.html { redirect_to @pergunta_quiz, notice: 'Pergunta do quiz atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @pergunta_quiz }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @pergunta_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perguntas_quiz/1
  # DELETE /perguntas_quiz/1.json
  def destroy
    authorize! :destroy, PerguntaQuiz
    @pergunta_quiz.destroy
    respond_to do |format|
      format.html { redirect_to perguntas_quiz_url, notice: 'Pergunta do quiz excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pergunta_quiz
      @pergunta_quiz = PerguntaQuiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pergunta_quiz_params
      params.require(:pergunta_quiz).permit(:quiz_id, :descricao)
    end
end
