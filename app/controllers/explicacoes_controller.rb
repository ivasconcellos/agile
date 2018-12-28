class ExplicacoesController < ApplicationController
  before_action :set_explicacao, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  # GET /explicacoes
  # GET /explicacoes.json
  def index
    @explicacoes = Explicacao.joins(:modulo).where('modulos.curso_id = ?',
    current_usuario.curso_atual_id).page(params[:page]).order('nome')
    authorize! :index, Explicacao
  end

  # GET /explicacoes/1
  # GET /explicacoes/1.json
  def show
    authorize! :show, @explicacao
  end

  # GET /explicacoes/new
  def new
    @explicacao = Explicacao.new
    @explicacao.modulo_id = params[:modulo_id]
    authorize! :new, @explicacao
  end

  # GET /explicacoes/1/edit
  def edit
    authorize! :edit, @explicacao
  end

  # POST /explicacoes
  # POST /explicacoes.json
  def create
    @explicacao = Explicacao.new(explicacao_params)

    respond_to do |format|
      if @explicacao.save
        format.html { redirect_to @explicacao, notice: 'Explicação criada com sucesso!' }
        format.json { render :show, status: :created, location: @explicacao }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @explicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /explicacoes/1
  # PATCH/PUT /explicacoes/1.json
  def update
    respond_to do |format|
      if @explicacao.update(explicacao_params)
        format.html { redirect_to @explicacao, notice: 'Explicação atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @explicacao }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @explicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /explicacoes/1
  # DELETE /explicacoes/1.json
  def destroy
    authorize! :destroy, @explicacao
    @explicacao.destroy
    respond_to do |format|
      format.html { redirect_to explicacoes_url, notice: 'Explicação excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_explicacao
      @explicacao = Explicacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def explicacao_params
      params.require(:explicacao).permit(:nome, :descricao, :audio, :modulo_id)
    end
end
