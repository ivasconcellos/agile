class ArtefatosController < ApplicationController
  before_action :set_artefato, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /artefatos
  # GET /artefatos.json
  def index
    @q = Artefato.ransack(params[:q])
    @artefatos = @q.result.paginate(page: params[:page]).order('nome')
    authorize! :index, Artefato
    render layout: 'gestor'
  end

  # GET /artefatos/1
  # GET /artefatos/1.json
  def show
    authorize! :show, Artefato
    render layout: 'gestor'
  end

  # GET /artefatos/new
  def new
    authorize! :new, Artefato
    @artefato = Artefato.new
    @artefato.tema_curso_id = params[:tema_curso_id]
    render layout: 'gestor'
  end

  # GET /artefatos/1/edit
  def edit
    authorize! :edit, Artefato
    render layout: 'gestor'
  end

  # POST /artefatos
  # POST /artefatos.json
  def create
    @artefato = Artefato.new(artefato_params)

    respond_to do |format|
      if @artefato.save
        format.html { redirect_to @artefato, notice: 'Artefato cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @artefato }
      else
        format.html { render :new, layout: 'gestor' }
        format.json { render json: @artefato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artefatos/1
  # PATCH/PUT /artefatos/1.json
  def update
    respond_to do |format|
      if @artefato.update(artefato_params)
        format.html { redirect_to @artefato, notice: 'Artefato atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @artefato }
      else
        format.html { render :edit, layout: 'gestor' }
        format.json { render json: @artefato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artefatos/1
  # DELETE /artefatos/1.json
  def destroy
    authorize! :destroy, Artefato
    @artefato.destroy
    respond_to do |format|
      format.html { redirect_to artefatos_url, notice: 'Artefato excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artefato
      @artefato = Artefato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artefato_params
      params.require(:artefato).permit(:nome, :ativo, :tema_curso_id, :imagem)
    end
end
