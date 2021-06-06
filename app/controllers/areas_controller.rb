class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update]
  before_action :authenticate_any!

  # GET /areas
  # GET /areas.json
  def index
    authorize! :index, Area
    @q = Area.ransack(params[:q])
    @areas = @q.result.paginate(page: params[:page]).order('nome')
  end

  # GET /areas/1
  # GET /areas/1.json
  def show
    authorize! :show, Area
  end

  # GET /areas/new
  def new
    authorize! :new, Area
    @area = Area.new
  end

  # GET /areas/1/edit
  def edit
    authorize! :edit, Area
  end

  # POST /areas
  # POST /areas.json
  def create
    @area = Area.new(area_params)

    respond_to do |format|
      if @area.save
        format.html { redirect_to @area, notice: 'Área cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areas/1
  # PATCH/PUT /areas/1.json
  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to @area, notice: 'Área atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_params
      params.require(:area).permit(:nome, :ativa)
    end
end
