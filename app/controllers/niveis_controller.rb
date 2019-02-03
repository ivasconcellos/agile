class NiveisController < ApplicationController
  before_action :set_nivel, only: [:show, :edit, :update, :destroy]

  # GET /niveis
  # GET /niveis.json
  def index
    @niveis = Nivel.all
  end

  # GET /niveis/1
  # GET /niveis/1.json
  def show
  end

  # GET /niveis/new
  def new
    @nivel = Nivel.new
  end

  # GET /niveis/1/edit
  def edit
  end

  # POST /niveis
  # POST /niveis.json
  def create
    @nivel = Nivel.new(nivel_params)

    respond_to do |format|
      if @nivel.save
        format.html { redirect_to @nivel, notice: 'Nivel was successfully created.' }
        format.json { render :show, status: :created, location: @nivel }
      else
        format.html { render :new }
        format.json { render json: @nivel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /niveis/1
  # PATCH/PUT /niveis/1.json
  def update
    respond_to do |format|
      if @nivel.update(nivel_params)
        format.html { redirect_to @nivel, notice: 'Nivel was successfully updated.' }
        format.json { render :show, status: :ok, location: @nivel }
      else
        format.html { render :edit }
        format.json { render json: @nivel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /niveis/1
  # DELETE /niveis/1.json
  def destroy
    @nivel.destroy
    respond_to do |format|
      format.html { redirect_to niveis_url, notice: 'Nivel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nivel
      @nivel = Nivel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nivel_params
      params.require(:nivel).permit(:nome, :pontos_requeridos)
    end
end
