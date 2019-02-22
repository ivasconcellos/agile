class ArtefatosAlunosController < ApplicationController
  before_action :set_artefato_aluno, only: [:show, :edit, :update, :destroy]

  # GET /artefatos_alunos
  # GET /artefatos_alunos.json
  def index
    @artefatos_alunos = ArtefatoAluno.all
  end

  # GET /artefatos_alunos/1
  # GET /artefatos_alunos/1.json
  def show
  end

  # GET /artefatos_alunos/new
  def new
    @artefato_aluno = ArtefatoAluno.new
  end

  # GET /artefatos_alunos/1/edit
  def edit
  end

  # POST /artefatos_alunos
  # POST /artefatos_alunos.json
  def create
    @artefato_aluno = ArtefatoAluno.new(artefato_aluno_params)

    respond_to do |format|
      if @artefato_aluno.save
        format.html { redirect_to @artefato_aluno, notice: 'Artefato aluno was successfully created.' }
        format.json { render :show, status: :created, location: @artefato_aluno }
      else
        format.html { render :new }
        format.json { render json: @artefato_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artefatos_alunos/1
  # PATCH/PUT /artefatos_alunos/1.json
  def update
    respond_to do |format|
      if @artefato_aluno.update(artefato_aluno_params)
        format.html { redirect_to @artefato_aluno, notice: 'Artefato aluno was successfully updated.' }
        format.json { render :show, status: :ok, location: @artefato_aluno }
      else
        format.html { render :edit }
        format.json { render json: @artefato_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artefatos_alunos/1
  # DELETE /artefatos_alunos/1.json
  def destroy
    @artefato_aluno.destroy
    respond_to do |format|
      format.html { redirect_to artefatos_alunos_url, notice: 'Artefato aluno was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artefato_aluno
      @artefato_aluno = ArtefatoAluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artefato_aluno_params
      params.require(:artefato_aluno).permit(:usuario_curso_id, :artefatos_id)
    end
end
