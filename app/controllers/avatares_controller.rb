class AvataresController < ApplicationController
  before_action :set_avatar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  def index
    authorize! :index, Avatar
    @q = Avatar.ransack(params[:q])
    @avatares = @q.result.paginate(page: params[:page]).order('nome')
  end

  # GET /avatares/1
  # GET /avatares/1.json
  def show
    authorize! :show, Avatar
  end

  # GET /avatares/new
  def new
    authorize! :new, Avatar
    @avatar = Avatar.new
    @avatar.grupo_id = params[:grupo_id]
  end

  # GET /avatares/1/edit
  def edit
    authorize! :edit, Avatar
  end

  # POST /avatares
  # POST /avatares.json
  def create
    @avatar = Avatar.new(avatar_params)

    respond_to do |format|
      if @avatar.save
        format.html { redirect_to @avatar.grupo, notice: 'Avatar cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @avatar }
      else
        format.html { render :new }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avatares/1
  # PATCH/PUT /avatares/1.json
  def update
    respond_to do |format|
      if @avatar.update(avatar_params)
        format.html { redirect_to @avatar.grupo, notice: 'Avatar atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @avatar }
      else
        format.html { render :edit }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avatares/1
  # DELETE /avatares/1.json
  def destroy
    authorize! :destroy, Avatar
    @grupo = @avatar.grupo
    
    respond_to do |format|
      if @avatar.destroy
        format.html { redirect_to @grupo, notice: 'Avatar excluído com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to @grupo, alert: 'O Avatar não pôde ser excluído, pois está sendo utilizado!' }
        format.json { head :no_content }
      end
    end
  end

  def visualizar_avatares
    @avatares = Avatar.where(grupo_id: params[:grupo_id], ativo: true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avatar
      @avatar = Avatar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avatar_params
      params.require(:avatar).permit(:grupo_id, :nome, :perfil, :ativo, :imagem)
    end
end
