class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :finalizar_quiz]
  before_action :authenticate_usuario!

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    authorize! :show, Quiz
    @quiz_perguntas = QuizPergunta.where(quiz_id: @quiz).order('created_at')
    @quiz.pontuacao
  end

  # GET /quizzes/new
  def new
    authorize! :new, Quiz
    @quiz = Quiz.new
    @quiz.missao_id = params[:missao_id]
  end

  # GET /quizzes/1/edit
  def edit
    authorize! :edit, Quiz
  end

  # POST /quizzes
  # POST /quizzes.json
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

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
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

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    authorize! :detroy, Quiz
    
    respond_to do |format|
      if @quiz.destroy
        format.html { redirect_to quizzes_url, notice: 'Quiz excluído com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to quizzes_url, alert: 'O Quiz não pôde ser excluído, pois está sendo utilizado!' }
        format.json { head :no_content }
      end
    end
  end

  def finalizar_quiz
    authorize! :new, Quiz
    @quiz.finalizado = true
    @quiz.save
    respond_to do |format|
      format.html { redirect_to @quiz, notice: 'Quiz finalizado com sucesso!' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:missao_id, :nome, :descricao, :usuario_curso_id, :finalizado)
    end
end
