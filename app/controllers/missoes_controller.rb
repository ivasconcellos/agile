class MissoesController < ApplicationController
  before_action :set_missao, only: [:show, :edit, :update, :destroy]

  # GET /missoes
  # GET /missoes.json
  def index
    @missoes = Missao.all
  end

  # GET /missoes/1
  # GET /missoes/1.json
  def show
  end

  # GET /missoes/new
  def new
    @missao = Missao.new
  end

  # GET /missoes/1/edit
  def edit
  end

  # POST /missoes
  # POST /missoes.json
  def create
    @missao = Missao.new(missao_params)

    respond_to do |format|
      if @missao.save
        format.html { redirect_to @missao, notice: 'Missao was successfully created.' }
        format.json { render :show, status: :created, location: @missao }
      else
        format.html { render :new }
        format.json { render json: @missao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missoes/1
  # PATCH/PUT /missoes/1.json
  def update
    respond_to do |format|
      if @missao.update(missao_params)
        format.html { redirect_to @missao, notice: 'Missao was successfully updated.' }
        format.json { render :show, status: :ok, location: @missao }
      else
        format.html { render :edit }
        format.json { render json: @missao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missoes/1
  # DELETE /missoes/1.json
  def destroy
    @missao.destroy
    respond_to do |format|
      format.html { redirect_to missoes_url, notice: 'Missao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_missao
      @missao = Missao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def missao_params
      params.require(:missao).permit(:curso_id, :usuario_curso_id, :nome, :descricao)
    end
end
