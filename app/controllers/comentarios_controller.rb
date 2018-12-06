class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /comentarios
  # GET /comentarios.json
  def index
    @comentarios = Comentario.all
    authorize! :index, @comentarios
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
    authorize! :show, @comentario
  end

  # GET /comentarios/new
  def new
    authorize! :new, @comentario
    @comentario = Comentario.new
    @comentario.forum_id = params[:forum_id]
  end

  # GET /comentarios/1/edit
  def edit
    authorize! :edit, @comentario
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = Comentario.new(comentario_params)
    @comentario.usuario_id = current_usuario.id
    if @comentario.save
      @comentario = Comentario.where(forum_id: @comentario.forum_id)
    end
  end

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to @comentario, notice: 'Comentário atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    authorize! :destroy, @comentario
    @forum = @comentario.forum_id
    @comentario.destroy
    if @comentario.destroy
      flash[notice] = 'Comentário atualizado com sucesso!'
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
      params.require(:comentario).permit(:usuario_id, :forum_id, :texto, :comentario_id)
    end
end
