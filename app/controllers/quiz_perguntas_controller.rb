class QuizPerguntasController < ApplicationController
  before_action :set_quiz_pergunta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /perguntas_quiz/1
  # GET /perguntas_quiz/1.json
  def show
    authorize! :show, QuizPergunta
    @quiz_pergunta_respostas = QuizPerguntaResposta.where(quiz_pergunta_id: @quiz_pergunta)
  end

  # GET /perguntas_quiz/new
  def new
    authorize! :new, QuizPergunta
    @quiz_pergunta = QuizPergunta.new
    @quiz_pergunta.quiz_id = params[:quiz_id]
  end

  # GET /perguntas_quiz/1/edit
  def edit
    authorize! :edit, QuizPergunta
  end

  # POST /perguntas_quiz
  # POST /perguntas_quiz.json
  def create
    @quiz_pergunta = QuizPergunta.new(quiz_pergunta_params)

    respond_to do |format|
      if @quiz_pergunta.save
        format.html { redirect_to @quiz_pergunta.quiz, notice: 'Pergunta do Quiz cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @quiz_pergunta }
      else
        format.html { render :new }
        format.json { render json: @quiz_pergunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perguntas_quiz/1
  # PATCH/PUT /perguntas_quiz/1.json
  def update
    respond_to do |format|
      if @quiz_pergunta.update(quiz_pergunta_params)
        format.html { redirect_to @quiz_pergunta.quiz, notice: 'Pergunta do Quiz atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @quiz_pergunta }
      else
        format.html { render :edit }
        format.json { render json: @quiz_pergunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perguntas_quiz/1
  # DELETE /perguntas_quiz/1.json
  def destroy
    authorize! :destroy, QuizPergunta
        
    respond_to do |format|
      if @quiz_pergunta.destroy
        format.html { redirect_to @quiz_pergunta.quiz, notice: 'Pergunta do Quiz excluída com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to @quiz_pergunta.quiz, alert: 'A Pergunta do Quiz não pôde ser excluída, pois está sendo utilizada!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_pergunta
      @quiz_pergunta = QuizPergunta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_pergunta_params
      params.require(:quiz_pergunta).permit(:quiz_id, :descricao, :pontuacao)
    end
end
