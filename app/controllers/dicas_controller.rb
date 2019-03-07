class DicasController < ApplicationController
  before_action :set_dica, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  
  # GET /dicas/1
  # GET /dicas/1.json
  def show
    authorize! :show, Dica
  end

  # GET /dicas/new
  def new
    @dica = Dica.new
    @dica.missao_id = params[:missao_id]
    authorize! :new, Dica
  end
  
  # GET /dicas/1/edit
  def edit
    authorize! :edit, Dica
  end
  
  # POST /dicas
  # POST /dicas.json
  def create
    @dica = Dica.new(dica_params)
    
    respond_to do |format|
      if @dica.save
        format.html { redirect_to @dica, notice: 'Dica cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @dica }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @dica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dicas/1
  # PATCH/PUT /dicas/1.json
  def update
    respond_to do |format|
      if @dica.update(dica_params)
        format.html { redirect_to @dica, notice: 'Dica atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @dica }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @dica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dicas/1
  # DELETE /dicas/1.json
  def destroy
    @dica.destroy
    respond_to do |format|
      format.html { redirect_to dicas_url, notice: 'Dica excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dica
      @dica = Dica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dica_params
      params.require(:dica).permit(:nome, :descricao, :ativo, :missao_id)
    end
end
