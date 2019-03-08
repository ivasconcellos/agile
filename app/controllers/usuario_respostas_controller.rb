class UsuarioRespostasController < ApplicationController
  before_action :set_usuario_resposta, only: [:show, :edit, :update, :destroy]

  # GET /usuario_respostas
  # GET /usuario_respostas.json
  def index
    @usuario_respostas = UsuarioResposta.all
  end

  # GET /usuario_respostas/1
  # GET /usuario_respostas/1.json
  def show
  end

  # GET /usuario_respostas/new
  def new
    @usuario_resposta = UsuarioResposta.new
  end

  # GET /usuario_respostas/1/edit
  def edit
  end

  # POST /usuario_respostas
  # POST /usuario_respostas.json
  def create
    @usuario_resposta = UsuarioResposta.new(usuario_resposta_params)

    respond_to do |format|
      if @usuario_resposta.save
        format.html { redirect_to @usuario_resposta, notice: 'Usuario resposta was successfully created.' }
        format.json { render :show, status: :created, location: @usuario_resposta }
      else
        format.html { render :new }
        format.json { render json: @usuario_resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuario_respostas/1
  # PATCH/PUT /usuario_respostas/1.json
  def update
    respond_to do |format|
      if @usuario_resposta.update(usuario_resposta_params)
        format.html { redirect_to @usuario_resposta, notice: 'Usuario resposta was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario_resposta }
      else
        format.html { render :edit }
        format.json { render json: @usuario_resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario_respostas/1
  # DELETE /usuario_respostas/1.json
  def destroy
    @usuario_resposta.destroy
    respond_to do |format|
      format.html { redirect_to usuario_respostas_url, notice: 'Usuario resposta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_resposta
      @usuario_resposta = UsuarioResposta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_resposta_params
      params.require(:usuario_resposta).permit(:usuario_curso_id, :respostas_perguntas_id)
    end
end
