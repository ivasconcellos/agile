class QuizesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /quizes
  # GET /quizes.json
  def index
    @quizes = Quiz.page(params[:page])
    authorize! :read, Quiz
  end

  # GET /quizes/1
  # GET /quizes/1.json
  def show
    authorize! :show, Quiz
  end

  # GET /quizes/new
  def new
    @quiz = Quiz.new
    @quiz.curso_id = params[:curso_id]
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
    @usuario = UsuarioCurso.select(:id).where(usuario_id: current_usuario.id, curso_id: current_usuario.curso_atual_id).first
    @quiz.usuario_curso_id = @usuario.id
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
      params.require(:quiz).permit(:curso_id, :nome, :descricao, :max_tentativas, :usuario_curso_id, :data_inicio, :data_termino)
    end
end
