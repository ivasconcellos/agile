class GruposController < ApplicationController
  before_action :set_grupo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_any!

  # GET /grupos
  # GET /grupos.json
  def index
    authorize! :index, Grupo
    @q = Grupo.ransack(params[:q])
    @grupos = @q.result.paginate(page: params[:page]).order('nome')
  end

  # GET /grupos/1
  # GET /grupos/1.json
  def show
    authorize! :show, Grupo
    @avatares = Avatar.where(grupo_id: @grupo.id)
  end

  # GET /grupos/new
  def new
    authorize! :new, Grupo
    @grupo = Grupo.new
  end

  # GET /grupos/1/edit
  def edit
    authorize! :edit, Grupo
  end

  # POST /grupos
  # POST /grupos.json
  def create
    @grupo = Grupo.new(grupo_params)

    respond_to do |format|
      if @grupo.save
        format.html { redirect_to @grupo, notice: 'Grupo cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @grupo }
      else
        format.html { render :new }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupos/1
  # PATCH/PUT /grupos/1.json
  def update
    respond_to do |format|
      if @grupo.update(grupo_params)
        format.html { redirect_to @grupo, notice: 'Grupo atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @grupo }
      else
        format.html { render :edit }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos/1
  # DELETE /grupos/1.json
  def destroy
    authorize! :destroy, Grupo
    
    respond_to do |format|
      if @grupo.destroy
        format.html { redirect_to grupos_url, notice: 'Grupo excluído com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to grupos_url, alert: 'O Grupo não pôde ser excluído, pois está em uso!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo
      @grupo = Grupo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupo_params
      params.require(:grupo).permit(:nome, :ativo, :imagem, :perfil)
    end
end
