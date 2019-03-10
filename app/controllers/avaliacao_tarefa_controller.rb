class AvaliacaoTarefaController < ApplicationController
  before_action :set_avaliacao_tarefa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /avaliacao_tarefa/1
  # GET /avaliacao_tarefa/1.json
  def show
    authorize! :show, AvaliacaoTarefa
  end

  # GET /avaliacao_tarefa/new
  def new
    authorize! :new, AvaliacaoTarefa
    @avaliacao_tarefa = AvaliacaoTarefa.new
    @avaliacao_tarefa.tarefa_aluno_id = params[:tarefa_aluno_id]
    @avaliacao_tarefa.usuario_curso_id = @perfil.id
  end

  # GET /avaliacao_tarefa/1/edit
  def edit
    authorize! :edit, AvaliacaoTarefa
  end

  # POST /avaliacao_tarefa
  # POST /avaliacao_tarefa.json
  def create
    @avaliacao_tarefa = AvaliacaoTarefa.new(avaliacao_tarefa_params)

    respond_to do |format|
      if @avaliacao_tarefa.save
        @avaliacao_tarefa.tarefa_aluno.avaliada = true
        @avaliacao_tarefa.tarefa_aluno.save!
        @avaliacao_tarefa.pontuacao_aluno(nil)
        format.html { redirect_to @avaliacao_tarefa, notice: 'Avaliação da tarefa cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @avaliacao_tarefa }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @avaliacao_tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliacao_tarefa/1
  # PATCH/PUT /avaliacao_tarefa/1.json
  def update
    @nota = @avaliacao_tarefa.nota
    respond_to do |format|
      if @avaliacao_tarefa.update(avaliacao_tarefa_params)
        @avaliacao_tarefa.pontuacao_aluno(@nota)
        format.html { redirect_to @avaliacao_tarefa, notice: 'Avaliação da tarefa atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @avaliacao_tarefa }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @avaliacao_tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliacao_tarefa/1
  # DELETE /avaliacao_tarefa/1.json
  def destroy
    authorize! :destroy, AvaliacaoTarefa
    @avaliacao_tarefa.destroy
    respond_to do |format|
      format.html { redirect_to avaliacao_tarefa_index_url, notice: 'Avaliação da tarefa excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao_tarefa
      @avaliacao_tarefa = AvaliacaoTarefa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliacao_tarefa_params
      params.require(:avaliacao_tarefa).permit(:tarefa_aluno_id, :nota, :comentario, :usuario_curso_id)
    end
end
