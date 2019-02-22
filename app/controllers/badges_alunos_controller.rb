class BadgesAlunosController < ApplicationController
  before_action :set_badge_aluno, only: [:show, :edit, :update, :destroy]

  # GET /badges_alunos
  # GET /badges_alunos.json
  def index
    @badges_alunos = BadgeAluno.all
  end

  # GET /badges_alunos/1
  # GET /badges_alunos/1.json
  def show
  end

  # GET /badges_alunos/new
  def new
    @badge_aluno = BadgeAluno.new
  end

  # GET /badges_alunos/1/edit
  def edit
  end

  # POST /badges_alunos
  # POST /badges_alunos.json
  def create
    @badge_aluno = BadgeAluno.new(badge_aluno_params)

    respond_to do |format|
      if @badge_aluno.save
        format.html { redirect_to @badge_aluno, notice: 'Badge aluno was successfully created.' }
        format.json { render :show, status: :created, location: @badge_aluno }
      else
        format.html { render :new }
        format.json { render json: @badge_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badges_alunos/1
  # PATCH/PUT /badges_alunos/1.json
  def update
    respond_to do |format|
      if @badge_aluno.update(badge_aluno_params)
        format.html { redirect_to @badge_aluno, notice: 'Badge aluno was successfully updated.' }
        format.json { render :show, status: :ok, location: @badge_aluno }
      else
        format.html { render :edit }
        format.json { render json: @badge_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badges_alunos/1
  # DELETE /badges_alunos/1.json
  def destroy
    @badge_aluno.destroy
    respond_to do |format|
      format.html { redirect_to badges_alunos_url, notice: 'Badge aluno was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge_aluno
      @badge_aluno = BadgeAluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_aluno_params
      params.require(:badge_aluno).permit(:usuario_curso_id, :badges_id)
    end
end
