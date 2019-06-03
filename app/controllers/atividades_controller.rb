class AtividadesController < ApplicationController
  before_action :set_atividade, only: [:show, :edit, :update, :destroy]

  # GET /atividades
  # GET /atividades.json
  def index
    @atividades = Atividade.all
  end

  # GET /atividades/1
  # GET /atividades/1.json
  def show
    authorize! :show, Atividade
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /atividades/new
  def new
    authorize! :new, Atividade
    @atividade = Atividade.new
    @atividade.modulo_id = params[:modulo_id]

  end

  # GET /atividades/1/edit
  def edit
  end

  # POST /atividades
  # POST /atividades.json
  def create
    @atividade = Atividade.new(atividade_params)
    @atividade.usuario_curso_id = @perfil.id
    respond_to do |format|
      if @atividade.save
        format.html { redirect_to @atividade, notice: 'Atividade criada com sucesso.' }
        format.json { render :show, status: :created, location: @atividade }
      else
        format.html { render :new }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atividades/1
  # PATCH/PUT /atividades/1.json
  def update
    respond_to do |format|
      if @atividade.update(atividade_params)
        format.html { redirect_to @atividade.modulo.curso, notice: 'Não foi possível criar a atividade.' }
        format.json { render :show, status: :ok, location: @atividade }
      else
        format.html { render :edit }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atividades/1
  # DELETE /atividades/1.json
  def destroy
    @atividade.destroy
    respond_to do |format|
      format.html { redirect_to @atividade.modulo.curso, notice: 'Atividade excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atividade
      @atividade = Atividade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atividade_params
      params.require(:atividade).permit(:pontuacao, :descricao, :usuario_curso_id, :modulo_id)
    end
end
