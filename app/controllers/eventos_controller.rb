class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /eventos
  # GET /eventos.json
  def index
    authorize! :index, Evento
    @eventos = Evento.where(usuario_curso_id: @perfil.id).page(params[:page]).order('data desc')
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
    authorize! :show, Evento
  end

  # GET /eventos/new
  def new
    authorize! :new, Evento
    @evento = Evento.new
    @evento.usuario_curso_id = @perfil.id
  end

  # GET /eventos/1/edit
  def edit
    authorize! :edit, Evento
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: 'Evento atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    authorize! :destroy, Evento
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: 'Evento excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:nome, :descricao, :data, :hora, :usuario_curso_id)
    end
end