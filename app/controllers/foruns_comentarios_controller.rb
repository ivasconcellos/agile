class ForunsComentariosController < ApplicationController
  before_action :set_forum_comentario, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /forum_comentarios/new
  def new
    authorize! :new, ForumComentario
    @forum_comentario = ForumComentario.new
    @forum_comentario.forum_id = params[:forum_id]
    @forum_comentario.forum_comentario_id = params[:forum_comentario_id]
  end

  # GET /forum_comentarios/1/edit
  def edit
    authorize! :edit, ForumComentario
  end

  # POST /forum_comentarios
  # POST /forum_comentarios.json
  def create
    @forum_comentario = ForumComentario.new(forum_comentario_params)
    @forum_comentario.usuario_curso_id = @perfil.id
    
    if @forum_comentario.save
      @forum_comentario = ForumComentario.where(forum_id: @forum_comentario.forum_id)
    else
      respond_to do |format|
        format.js { render :new }
        format.json { render json: @forum_comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum_comentarios/1
  # PATCH/PUT /forum_comentarios/1.json
  def update
    if @forum_comentario.update(forum_comentario_params)
      @forum_comentario = ForumComentario.where(forum_id: @forum_comentario.forum_id)
    else
      respond_to do |format|
        format.js { render :edit }
        format.json { render json: @forum_comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_comentarios/1
  # DELETE /forum_comentarios/1.json
  def destroy
    authorize! :destroy, ForumComentario
    @forum = @forum_comentario.forum_id
    @forum_comentario.destroy
    if @forum_comentario.destroy
      @forum_comentario = ForumComentario.where(forum_id: @forum)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_comentario
      @forum_comentario = ForumComentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_comentario_params
      params.require(:forum_comentario).permit(:usuario_curso_id, :forum_id, :texto, :forum_comentario_id)
    end
end
