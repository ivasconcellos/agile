class RecompensasController < ApplicationController
  before_action :set_recompensa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /recompensas
  # GET /recompensas.json
  def index
    @recompensas = Recompensa.where(curso_id: @perfil.curso_id).order('posicao_ranking')
    authorize! :index, Recompensa
  end

  # GET /recompensas/1
  # GET /recompensas/1.json
  def show
    authorize! :show, Recompensa
  end

  # GET /recompensas/new
  def new
    authorize! :new, Recompensa
    @recompensa = Recompensa.new
  end

  # GET /recompensas/1/edit
  def edit
    authorize! :edit, Recompensa
  end

  # POST /recompensas
  # POST /recompensas.json
  def create
    @recompensa = Recompensa.new(recompensa_params)
    @recompensa.usuario_curso_id = @perfil.id
    @recompensa.curso_id = @perfil.curso_id
    respond_to do |format|
      if @recompensa.save
        format.html { redirect_to @recompensa, notice: 'Recompensa cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @recompensa }
      else
        format.html { render :new }
        format.json { render json: @recompensa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recompensas/1
  # PATCH/PUT /recompensas/1.json
  def update
    respond_to do |format|
      if @recompensa.update(recompensa_params)
        format.html { redirect_to @recompensa, notice: 'Recompensa atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @recompensa }
      else
        format.html { render :edit }
        format.json { render json: @recompensa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recompensas/1
  # DELETE /recompensas/1.json
  def destroy
    authorize! :destroy, Recompensa
    @recompensa.destroy
    respond_to do |format|
      format.html { redirect_to recompensas_url, notice: 'Recompensa excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recompensa
      @recompensa = Recompensa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recompensa_params
      params.require(:recompensa).permit(:posicao_ranking, :nome, :descricao, :usuario_curso_id, :curso_id)
    end
end
