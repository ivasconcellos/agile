class QuizesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /quizes/1
  # GET /quizes/1.json
  def show
    authorize! :show, Quiz
    @perguntas_quizes = PerguntaQuiz.where(quiz_id: @quiz)
    @quiz.pontuacao
  end

  # GET /quizes/new
  def new
    @quiz = Quiz.new
    @quiz.missao_id = params[:missao_id]
    authorize! :new, Quiz
  end

  # GET /quizes/1/edit
  def edit
    authorize! :edit, Quiz
  end

  # POST /quizes
  # POST /quizes.json
  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.usuario_curso_id = @perfil.id
    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizes/1
  # PATCH/PUT /quizes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizes/1
  # DELETE /quizes/1.json
  def destroy
    authorize! :detroy, Quiz
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizes_url, notice: 'Quiz excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:missao_id, :nome, :descricao, :usuario_curso_id)
    end
end
