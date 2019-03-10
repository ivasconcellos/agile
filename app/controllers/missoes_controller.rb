class MissoesController < ApplicationController
  before_action :set_missao, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /missoes
  # GET /missoes.json
  def index
    authorize! :index, Missao
    @missoes = Missao.joins(:modulo).where('modulos.curso_id = ?', current_usuario.curso_atual_id).page(params[:page])
  end

  # GET /missoes/1
  # GET /missoes/1.json
  def show
    @dicas = Dica.where(missao_id: @missao.id).order(:nome)
    authorize! :show, Missao
  end

  # GET /missoes/new
  def new
    authorize! :new, Missao
    @missao = Missao.new
    @missao.usuario_curso_id = @perfil.id
    @missao.modulo_id = params[:modulo_id]
  end

  # GET /missoes/1/edit
  def edit
    authorize! :edit, Missao
  end

  # POST /missoes
  # POST /missoes.json
  def create
    @missao = Missao.new(missao_params)

    respond_to do |format|
      if @missao.save
        format.html { redirect_to @missao, notice: 'Missão cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @missao }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @missao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missoes/1
  # PATCH/PUT /missoes/1.json
  def update
    respond_to do |format|
      if @missao.update(missao_params)
        format.html { redirect_to @missao, notice: 'Missão atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @missao }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @missao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missoes/1
  # DELETE /missoes/1.json
  def destroy
    authorize! :destroy, Missao
    @missao.destroy
    respond_to do |format|
      format.html { redirect_to missoes_url, notice: 'Missão excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_missao
      @missao = Missao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def missao_params
      params.require(:missao).permit(:modulo_id, :usuario_curso_id, :nome, :descricao, :publico, :imagem, :tipo, :pontuacao, :data_inicio, :hora_inicio, :data_termino, :hora_termino)
    end
end
