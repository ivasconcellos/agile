class ArtefatosAlunosController < ApplicationController
  before_action :authenticate_usuario!

  # GET /artefatos_alunos
  # GET /artefatos_alunos.json
  def index
    @artefatos_alunos = ArtefatoAluno.all
    authorize! :index, ArtefatoAluno
  end

  # GET /artefatos_alunos/new
  def new
    @artefato_aluno = ArtefatoAluno.new
    authorize! :new, ArtefatoAluno
  end

  # POST /artefatos_alunos
  # POST /artefatos_alunos.json
  def create
    @artefato_aluno = ArtefatoAluno.new(artefato_aluno_params)

    respond_to do |format|
      if @artefato_aluno.save
        format.html { redirect_to @artefato_aluno, notice: 'Parabéns! Você recebeu um novo Artefato!' }
        format.json { render :show, status: :created, location: @artefato_aluno }
      else
        format.html { render :new }
        format.json { render json: @artefato_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  private
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def artefato_aluno_params
      params.require(:artefato_aluno).permit(:usuario_curso_id, :artefatos_id)
    end
end
