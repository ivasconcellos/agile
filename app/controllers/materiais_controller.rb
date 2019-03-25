class MateriaisController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy, :texto]
  before_action :authenticate_usuario!

  # GET /materiais/1
  # GET /materiais/1.json
  def show
    authorize! :show, Material
  end

  # GET /materiais/new
  def new
    @material = Material.new
    @material.modulo_id = params[:modulo_id]
    @material.tipo = params[:tipo]
    authorize! :new, Material
  end

  # GET /materiais/1/edit
  def edit
    authorize! :edit, Material
  end

  # POST /materiais
  # POST /materiais.json
  def create
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material.modulo.curso, notice: 'Material criado com sucesso!' }
        format.json { render :show, status: :created, location: @material.modulo }
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
        format.html { redirect_to @material.modulo.curso, notice: 'Material atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @material.modulo }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materiais/1
  # DELETE /materiais/1.json
  def destroy
    authorize! :destroy, Material
    
    respond_to do |format|
      if @material.destroy
        format.html { redirect_to @material.modulo.curso, notice: 'Material excluído com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to @material.modulo.curso, notice: 'O Material não pôde ser excluído, pois está sendo utilizado!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:nome, :texto, :modulo_id, :publico, :arquivo, :tipo)
    end
end
