class AvataresController < ApplicationController
  before_action :set_avatar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /avatares
  # GET /avatares.json
  def index
    @avatares = Avatar.all
    authorize! :index, @avatares
  end

  # GET /avatares/1
  # GET /avatares/1.json
  def show
    authorize! :show, @avatar
  end

  # GET /avatares/new
  def new
    @avatar = Avatar.new
    authorize! :new, @avatar
  end

  # GET /avatares/1/edit
  def edit
    authorize! :edit, @avatar
  end

  # POST /avatares
  # POST /avatares.json
  def create
    @avatar = Avatar.new(avatar_params)

    respond_to do |format|
      if @avatar.save
        format.html { redirect_to @avatar, notice: 'Avatar cadastrado com sucesso!' }
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
        format.html { redirect_to @avatar, notice: 'Avatar atualizado com sucesso!' }
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
    authorize! :destroy, @avatar
    @avatar.destroy
    respond_to do |format|
      format.html { redirect_to avatares_url, notice: 'Avatar excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avatar
      @avatar = Avatar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avatar_params
      params.require(:avatar).permit(:tema_curso_id, :nome, :perfil, :imagem)
    end
end
