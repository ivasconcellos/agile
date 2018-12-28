class ModulosController < ApplicationController
  before_action :set_modulo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /modulos
  # GET /modulos.json
  def index
    @modulos = Modulo.where(curso_id: current_usuario.curso_atual_id).page(params[:page]).order('nome')
    authorize! :read, Modulo
  end

  # GET /modulos/1
  # GET /modulos/1.json
  def show
    @materiais = Material.where(modulo_id: @modulo)
    @explicacoes = Explicacao.where(modulo_id: @modulo)
    authorize! :show, @modulo
  end

  # GET /modulos/new
  def new
    @modulo = Modulo.new
    @modulo.curso_id = params[:curso_id]
    authorize! :new, @modulo
  end

  # GET /modulos/1/edit
  def edit
    authorize! :edit, @modulo
  end

  # POST /modulos
  # POST /modulos.json
  def create
    @modulo = Modulo.new(modulo_params)

    respond_to do |format|
      if @modulo.save
        format.html { redirect_to @modulo, notice: 'Módulo cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @modulo }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modulos/1
  # PATCH/PUT /modulos/1.json
  def update
    respond_to do |format|
      if @modulo.update(modulo_params)
        format.html { redirect_to @modulo, notice: 'Módulo atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @modulo }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modulos/1
  # DELETE /modulos/1.json
  def destroy
    authorize! :destroy, @modulo
    @modulo.destroy
    respond_to do |format|
      format.html { redirect_to modulos_url, notice: 'Módulo excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modulo
      @modulo = Modulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modulo_params
      params.require(:modulo).permit(:nome, :descricao, :curso_id, :publico)
    end
end
