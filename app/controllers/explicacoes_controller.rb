class ExplicacoesController < ApplicationController
  before_action :set_explicacao, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /explicacoes/1
  # GET /explicacoes/1.json
  def show
    authorize! :show, Explicacao
  end

  # GET /explicacoes/new
  def new
    authorize! :new, Explicacao
    @explicacao = Explicacao.new
    @explicacao.modulo_id = params[:modulo_id]
  end

  # GET /explicacoes/1/edit
  def edit
    authorize! :edit, Explicacao
  end

  # POST /explicacoes
  # POST /explicacoes.json
  def create
    @explicacao = Explicacao.new(explicacao_params)

    respond_to do |format|
      if @explicacao.save
        format.html { redirect_to @explicacao, notice: 'Explicação cadastrada com sucesso!' }
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
    authorize! :destroy, Explicacao
    
    respond_to do |format|
      if @explicacao.destroy
        format.html { redirect_to @explicacao.modulo, notice: 'Explicação excluída com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to @explicacao.modulo, alert: 'A Explicação não pôde ser excluída, pois está sendo utilizada!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_explicacao
      @explicacao = Explicacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def explicacao_params
      params.require(:explicacao).permit(:nome, :descricao, :modulo_id)
    end
end
