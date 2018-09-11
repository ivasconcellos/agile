class MateriaisController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /materiais
  # GET /materiais.json
  def index
    @materiais = Material.joins(:conteudo).where('conteudos.curso_id = ?',
    current_usuario.curso_atual_id).page(params[:page]).order('nome')
    authorize! :index, @materiais
  end

  # GET /materiais/1
  # GET /materiais/1.json
  def show
    authorize! :show, @material
  end

  # GET /materiais/new
  def new
    @material = Material.new
    @material.conteudo_id = params[:conteudo_id]
    authorize! :new, @material
  end

  # GET /materiais/1/edit
  def edit
    authorize! :edit, @material
  end

  # POST /materiais
  # POST /materiais.json
  def create
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'Material criado com sucesso!' }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materiais/1
  # PATCH/PUT /materiais/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: 'Material atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materiais/1
  # DELETE /materiais/1.json
  def destroy
    authorize! :destroy, @material
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materiais_url, notice: 'Material excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:nome, :descricao, :link, :conteudo_id)
    end
end
