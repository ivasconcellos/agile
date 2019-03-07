class ForunsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /foruns
  # GET /foruns.json
  def index
    authorize! :index, Forum
    @foruns = Forum.where(curso_id: current_usuario.curso_atual_id).page(params[:page])
  end

  # GET /foruns/1
  # GET /foruns/1.json
  def show
    authorize! :show, Forum
    @comentario = Comentario.where(forum_id: @forum)
  end

  # GET /foruns/new
  def new
    authorize! :new, Forum
    @forum = Forum.new
    @forum.curso_id = params[:curso_id]
  end

  # GET /foruns/1/edit
  def edit
    authorize! :edit, Forum
  end

  # POST /foruns
  # POST /foruns.json
  def create
    @forum = Forum.new(forum_params)
    @usuario = UsuarioCurso.select(:id).where(usuario_id: current_usuario.id, curso_id: current_usuario.curso_atual_id).first
    @forum.usuario_curso_id = @usuario.id
    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Fórum criado com sucesso!' }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foruns/1
  # PATCH/PUT /foruns/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: 'Fórum atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foruns/1
  # DELETE /foruns/1.json
  def destroy
    authorize! :destroy, Forum
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to foruns_url, notice: 'Fórum excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:forum).permit(:titulo, :descricao, :ativo, :curso_id, :usuario_curso_id)
    end
end
