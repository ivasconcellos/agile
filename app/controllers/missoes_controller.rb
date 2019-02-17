class MissoesController < ApplicationController
  before_action :set_missao, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /missoes
  # GET /missoes.json
  def index
    @missoes = Missao.where(curso_id: current_usuario.curso_atual_id).page(params[:page])
    authorize! :read, Missao
    render layout: 'professor'
  end

  # GET /missoes/1
  # GET /missoes/1.json
  def show
    authorize! :show, Missao
  end

  # GET /missoes/new
  def new
    @missao = Missao.new
    @usuario_curso = UsuarioCurso.find_by(usuario_id: current_usuario.id, curso_id: current_usuario.curso_atual.id)
    @missao.usuario_curso_id = @usuario_curso.id
    @missao.curso_id = @usuario_curso.curso.id
    authorize! :new, Missao
  end

  # GET /missoes/1/edit
  def edit
    authorize! :edit, Missao
  end

  # POST /missoes
  # POST /missoes.json
  def create
    @missao = Missao.new(missao_params)

    respond_to do |format|
      if @missao.save
        format.html { redirect_to @missao, notice: 'Missão cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @missao }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @missao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missoes/1
  # PATCH/PUT /missoes/1.json
  def update
    respond_to do |format|
      if @missao.update(missao_params)
        format.html { redirect_to @missao, notice: 'Missão atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @missao }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @missao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missoes/1
  # DELETE /missoes/1.json
  def destroy
    authorize! :destroy, Missao
    @missao.destroy
    respond_to do |format|
      format.html { redirect_to missoes_url, notice: 'Missão excluída com sucesso!' }
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
      params.require(:missao).permit(:curso_id, :usuario_curso_id, :nome, :descricao, :ativo, :imagem)
    end
end
