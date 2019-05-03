class ComunicadosController < ApplicationController
  before_action :set_comunicado, only: [:show]
  before_action :authenticate_usuario!

  # GET /comunicados
  # GET /comunicados.json
  def index
    authorize! :index, Comunicado
    @comunicados = Comunicado.where(curso_id: @perfil.curso_id).page(params[:page]).order('created_at desc')
  end

  # GET /comunicados/1
  # GET /comunicados/1.json
  def show
    authorize! :show, Comunicado
  end

  # GET /comunicados/new
  def new
    authorize! :new, Comunicado
    @comunicado = Comunicado.new
    @comunicado.curso_id = params[:curso_id]
  end

  # POST /comunicados
  # POST /comunicados.json
  def create
    @comunicado = Comunicado.new(comunicado_params)
    @comunicado.remetente_id = @perfil.id
    respond_to do |format|
      if @comunicado.save
        ApplicationMailer.comunicado_turma(@comunicado).deliver
        format.html { redirect_to @comunicado, notice: 'Comunicado enviado com sucesso!!!' }
        format.json { render :show, status: :created, location: @comunicado }
      else
        format.html { render :new }
        format.json { render json: @comunicado.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comunicado
      @comunicado = Comunicado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comunicado_params
      params.require(:comunicado).permit(:assunto, :mensagem, :remetente_id, :curso_id)
    end
end
