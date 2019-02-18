class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /comentarios/new
  def new
    authorize! :new, Comentario
    @comentario = Comentario.new
    @comentario.forum_id = params[:forum_id]
  end

  # GET /comentarios/1/edit
  def edit
    authorize! :edit, Comentario
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = Comentario.new(comentario_params)
    @usuario = UsuarioCurso.select(:id).where(usuario_id: current_usuario.id, curso_id: current_usuario.curso_atual_id).first
    @comentario.usuario_curso_id = @usuario.id
    
    if @comentario.save
      @comentario = Comentario.where(forum_id: @comentario.forum_id)
    end
  end

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    if @comentario.update(comentario_params)
      @comentario = Comentario.where(forum_id: @comentario.forum_id)
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    authorize! :destroy, Comentario
    @forum = @comentario.forum_id
    @comentario.destroy
    if @comentario.destroy
      @comentario = Comentario.where(forum_id: @forum)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.require(:comentario).permit(:usuario_curso_id, :forum_id, :texto, :comentario_id)
    end
end
