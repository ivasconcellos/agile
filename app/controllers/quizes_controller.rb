class QuizesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizes
  # GET /quizes.json
  def index
    @quizes = Quiz.all
  end

  # GET /quizes/1
  # GET /quizes/1.json
  def show
  end

  # GET /quizes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizes/1/edit
  def edit
  end

  # POST /quizes
  # POST /quizes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizes/1
  # PATCH/PUT /quizes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizes/1
  # DELETE /quizes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizes_url, notice: 'Quiz was successfully destroyed.' }
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
