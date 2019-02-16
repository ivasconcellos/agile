class BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /badges
  # GET /badges.json
  def index
    @q = Badge.ransack(params[:q])
    @badges = @q.result.paginate(page: params[:page]).order('nome')
    authorize! :index, Badge
    render layout: 'gestor'
  end

  # GET /badges/1
  # GET /badges/1.json
  def show
    authorize! :show, Badge
    render layout: 'gestor'
  end

  # GET /badges/new
  def new
    @badge = Badge.new
    authorize! :new, Badge
    render layout: 'gestor'
  end

  # GET /badges/1/edit
  def edit
    authorize! :edit, Badge
    render layout: 'gestor'
  end

  # POST /badges
  # POST /badges.json
  def create
    @badge = Badge.new(badge_params)

    respond_to do |format|
      if @badge.save
        format.html { redirect_to @badge, notice: 'Badge cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @badge }
      else
        format.html { render :new, layout: 'gestor' }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badges/1
  # PATCH/PUT /badges/1.json
  def update
    respond_to do |format|
      if @badge.update(badge_params)
        format.html { redirect_to @badge, notice: 'Badge atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @badge }
      else
        format.html { render :edit, layout: 'gestor' }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badges/1
  # DELETE /badges/1.json
  def destroy
    authorize! :destroy, Badge
    @badge.destroy
    respond_to do |format|
      format.html { redirect_to badges_url, notice: 'Badge excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge
      @badge = Badge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_params
      params.require(:badge).permit(:nome, :imagem, :ativo)
    end
end
