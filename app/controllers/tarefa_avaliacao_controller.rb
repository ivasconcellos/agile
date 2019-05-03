class TarefaAvaliacaoController < ApplicationController
  before_action :set_tarefa_avaliacao, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /tarefa_avaliacao/1
  # GET /tarefa_avaliacao/1.json
  def show
    authorize! :show, TarefaAvaliacao
  end

  # GET /tarefa_avaliacao/new
  def new
    authorize! :new, TarefaAvaliacao
    @tarefa_avaliacao = TarefaAvaliacao.new
    @tarefa_avaliacao.tarefa_aluno_id = params[:tarefa_aluno_id]
    @tarefa_avaliacao.usuario_curso_id = @perfil.id
  end

  # GET /tarefa_avaliacao/1/edit
  def edit
    authorize! :edit, TarefaAvaliacao
  end

  # POST /tarefa_avaliacao
  # POST /tarefa_avaliacao.json
  def create
    @tarefa_avaliacao = TarefaAvaliacao.new(tarefa_avaliacao_params)

    respond_to do |format|
      if @tarefa_avaliacao.save
        @tarefa_avaliacao.tarefa_aluno.avaliada = true
        @tarefa_avaliacao.tarefa_aluno.save!
        @tarefa_avaliacao.pontuacao_aluno(nil)
        begin
          ApplicationMailer.tarefa_avaliada(@tarefa_avaliacao).deliver
        rescue StandardError => e
          flash[:alert] = 'Erro ao enviar o e-mail!'
        end        
        format.html { redirect_to @tarefa_avaliacao, notice: 'Avaliação da tarefa cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @tarefa_avaliacao }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @tarefa_avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarefa_avaliacao/1
  # PATCH/PUT /tarefa_avaliacao/1.json
  def update
    @nota = @tarefa_avaliacao.nota
    respond_to do |format|
      if @tarefa_avaliacao.update(tarefa_avaliacao_params)
        @tarefa_avaliacao.pontuacao_aluno(@nota)
        begin
          ApplicationMailer.tarefa_avaliada(@tarefa_avaliacao).deliver
        rescue StandardError => e
          flash[:alert] = 'Erro ao enviar o e-mail!'
        end        
        format.html { redirect_to @tarefa_avaliacao, notice: 'Avaliação da tarefa atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @tarefa_avaliacao }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @tarefa_avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa_avaliacao
      @tarefa_avaliacao = TarefaAvaliacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarefa_avaliacao_params
      params.require(:tarefa_avaliacao).permit(:tarefa_aluno_id, :nota, :comentario, :usuario_curso_id)
    end
end
