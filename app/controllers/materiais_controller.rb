class MateriaisController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  # GET /materiais
  # GET /materiais.json
  def index
    @materiais = Material.all
  end

  # GET /materiais/1
  # GET /materiais/1.json
  def show
  end

  # GET /materiais/new
  def new
    @material = Material.new
  end

  # GET /materiais/1/edit
  def edit
  end

  # POST /materiais
  # POST /materiais.json
  def create
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'Material was successfully created.' }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materiais/1
  # PATCH/PUT /materiais/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: 'Material was successfully updated.' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materiais/1
  # DELETE /materiais/1.json
  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materiais_url, notice: 'Material was successfully destroyed.' }
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
