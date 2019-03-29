class DialogosController < ApplicationController
  before_action :set_dialogo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /dialogos/1
  # GET /dialogos/1.json
  def show
    authorize! :show, Dialogo
  end

  # GET /dialogos/new
  def new
    authorize! :new, Dialogo
    @dialogo = Dialogo.new
    @dialogo.modulo_id = params[:modulo_id]
  end

  # GET /dialogos/1/edit
  def edit
    authorize! :edit, Dialogo
  end

  # POST /dialogos
  # POST /dialogos.json
  def create
    @dialogo = Dialogo.new(dialogo_params)
    @dialogo.usuario_curso_id = @perfil.id
    respond_to do |format|
      if @dialogo.save
        format.html { redirect_to @dialogo.modulo.curso, notice: 'Diálogo cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @dialogo }
      else
        format.html { render :new }
        format.json { render json: @dialogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dialogos/1
  # PATCH/PUT /dialogos/1.json
  def update
    respond_to do |format|
      if @dialogo.update(dialogo_params)
        format.html { redirect_to @dialogo.modulo.curso, notice: 'Diálogo atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @dialogo }
      else
        format.html { render :edit }
        format.json { render json: @dialogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dialogos/1
  # DELETE /dialogos/1.json
  def destroy
    authorize! :destroy, Dialogo
    @dialogo.destroy
    respond_to do |format|
      format.html { redirect_to @dialogo.modulo.curso, notice: 'Diálogo excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dialogo
      @dialogo = Dialogo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dialogo_params
      params.require(:dialogo).permit(:nome, :texto, :usuario_curso_id, :modulo_id)
    end
end
