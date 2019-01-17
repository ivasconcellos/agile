class AvaliacaoTarefaController < ApplicationController
  before_action :set_avaliacao_tarefa, only: [:show, :edit, :update, :destroy]

  # GET /avaliacao_tarefa
  # GET /avaliacao_tarefa.json
  def index
    @avaliacao_tarefa = AvaliacaoTarefa.all
  end

  # GET /avaliacao_tarefa/1
  # GET /avaliacao_tarefa/1.json
  def show
  end

  # GET /avaliacao_tarefa/new
  def new
    @avaliacao_tarefa = AvaliacaoTarefa.new
  end

  # GET /avaliacao_tarefa/1/edit
  def edit
  end

  # POST /avaliacao_tarefa
  # POST /avaliacao_tarefa.json
  def create
    @avaliacao_tarefa = AvaliacaoTarefa.new(avaliacao_tarefa_params)

    respond_to do |format|
      if @avaliacao_tarefa.save
        format.html { redirect_to @avaliacao_tarefa, notice: 'Avaliacao tarefa was successfully created.' }
        format.json { render :show, status: :created, location: @avaliacao_tarefa }
      else
        format.html { render :new }
        format.json { render json: @avaliacao_tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliacao_tarefa/1
  # PATCH/PUT /avaliacao_tarefa/1.json
  def update
    respond_to do |format|
      if @avaliacao_tarefa.update(avaliacao_tarefa_params)
        format.html { redirect_to @avaliacao_tarefa, notice: 'Avaliacao tarefa was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliacao_tarefa }
      else
        format.html { render :edit }
        format.json { render json: @avaliacao_tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliacao_tarefa/1
  # DELETE /avaliacao_tarefa/1.json
  def destroy
    @avaliacao_tarefa.destroy
    respond_to do |format|
      format.html { redirect_to avaliacao_tarefa_index_url, notice: 'Avaliacao tarefa was successfully destroyed.' }
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
