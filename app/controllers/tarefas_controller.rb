class TarefasController < ApplicationController
  before_action :set_tarefa, only: [:show, :edit, :update, :destroy, :visualizar_respostas]
  before_action :authenticate_usuario!
  # GET /tarefas
  # GET /tarefas.json
  def index
    @tarefas = Tarefa.joins(:modulo).where('modulos.curso_id = ?',
       current_usuario.curso_atual_id).page(params[:page])
    authorize! :read, Tarefa
  end

  # GET /tarefas/1
  # GET /tarefas/1.json
  def show
    authorize! :show, Tarefa
    @tarefa_aluno = TarefaAluno.find_by(tarefa_id: @tarefa.id, usuario_curso_id: @perfil.id)
  end

  # GET /tarefas/new
  def new
    @tarefa = Tarefa.new
    @tarefa.modulo_id = params[:modulo_id]
    @tarefa.usuario_curso_id = UsuarioCurso.find_by(usuario_id: current_usuario.id, curso_id: current_usuario.curso_atual.id).id
    authorize! :new, Tarefa
  end

  # GET /tarefas/1/edit
  def edit
    authorize! :edit, Tarefa
  end

  # POST /tarefas
  # POST /tarefas.json
  def create
    @tarefa = Tarefa.new(tarefa_params)

    respond_to do |format|
      if @tarefa.save
        format.html { redirect_to @tarefa, notice: 'Tarefa cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @tarefa }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarefas/1
  # PATCH/PUT /tarefas/1.json
  def update

    respond_to do |format|
      if @tarefa.update(tarefa_params)
        format.html { redirect_to @tarefa, notice: 'Tarefa atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @tarefa }
      else
        format.html { render :edit , @current_usuario => current_usuario}
        format.json { render json: @tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarefas/1
  # DELETE /tarefas/1.json
  def destroy
    authorize! :destroy, Tarefa
    @tarefa.destroy
    respond_to do |format|
      format.html { redirect_to tarefas_url, notice: 'Tarefa excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  def visualizar_respostas
    @tarefas_alunos = TarefaAluno.where(tarefa_id: @tarefa)
    @alunos_sem_envio = UsuarioCurso.joins(:tarefa_aluno).where.not("usuario_curso.perfil = ? and 
      tarefa_alunos.tarefa_id = ?", "Professor", @tarefa)
    authorize! :new, Tarefa
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa
      @tarefa = Tarefa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarefa_params
      params.require(:tarefa).permit(:modulo_id, :usuario_curso_id, :nome, :descricao, :pontuacao, :publico, :data_limite, :hora_limite)
    end
end
