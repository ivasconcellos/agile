class TarefaAlunosController < ApplicationController
  before_action :set_tarefa_aluno, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  
  # GET /tarefa_alunos
  # GET /tarefa_alunos.json
  def index
    authorize! :new, Tarefa
    @tarefa = Tarefa.find(params[:id])
    @tarefas_alunos = TarefaAluno.where(tarefa_id: @tarefa)
    @alunos_tarefa = @tarefas_alunos.select(:usuario_curso_id)
    @alunos_sem_envio = UsuarioCurso.where("curso_id = ? and id not in (?) and perfil =?", @tarefa.missao.modulo.curso_id, @alunos_tarefa, "Aluno")
  end

  # GET /tarefa_alunos/1
  # GET /tarefa_alunos/1.json
  def show
    authorize! :show, TarefaAluno
  end

  # GET /tarefa_alunos/new
  def new
    authorize! :new, TarefaAluno
    @tarefa_aluno = TarefaAluno.new
    @tarefa_aluno.tarefa_id = params[:tarefa_id]
  end

  # GET /tarefa_alunos/1/edit
  def edit
    authorize! :edit, TarefaAluno
  end

  # POST /tarefa_alunos
  # POST /tarefa_alunos.json
  def create
    @tarefa_aluno = TarefaAluno.new(tarefa_aluno_params)
    @tarefa_aluno.usuario_curso_id = @perfil.id
    respond_to do |format|
      if @tarefa_aluno.save
        format.html { redirect_to @tarefa_aluno, notice: 'Tarefa do aluno cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @tarefa_aluno }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @tarefa_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarefa_alunos/1
  # PATCH/PUT /tarefa_alunos/1.json
  def update
    respond_to do |format|
      if @tarefa_aluno.update(tarefa_aluno_params)
        format.html { redirect_to @tarefa_aluno, notice: 'Tarefa do aluno atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @tarefa_aluno }
      else
        format.html { render :edit, @current_usuario => current_usuario}
        format.json { render json: @tarefa_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa_aluno
      @tarefa_aluno = TarefaAluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarefa_aluno_params
      params.require(:tarefa_aluno).permit(:tarefa_id, :usuario_curso_id, :arquivo, :avaliada)
    end
end
