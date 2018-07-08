class UsuarioCursoController < ApplicationController
  before_action :set_usuario_curso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  
  # GET /usuario_curso
  # GET /usuario_curso.json
  def index
    @usuario_curso = UsuarioCurso.all.page(params[:page])
    authorize! :index, @usuario_curso
  end

  # GET /usuario_curso/1
  # GET /usuario_curso/1.json
  def show
    authorize! :show, @usuario_curso
  end

  # GET /usuario_curso/new
  def new
    @usuario_curso = UsuarioCurso.new
    authorize! :new, @usuario_curso
  end

  # GET /usuario_curso/1/edit
  def edit
    authorize! :edit, @usuario_curso
  end

  # POST /usuario_curso
  # POST /usuario_curso.json
  def create
    @usuario_curso = UsuarioCurso.new(usuario_curso_params)

    respond_to do |format|
      if @usuario_curso.save
        format.html { redirect_to @usuario_curso, notice: 'Usuário do Curso cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @usuario_curso }
      else
        format.html { render :new }
        format.json { render json: @usuario_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuario_curso/1
  # PATCH/PUT /usuario_curso/1.json
  def update
    respond_to do |format|
      if @usuario_curso.update(usuario_curso_params)
        format.html { redirect_to @usuario_curso, notice: 'Usuário do Curso atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @usuario_curso }
      else
        format.html { render :edit }
        format.json { render json: @usuario_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario_curso/1
  # DELETE /usuario_curso/1.json
  def destroy
    authorize! :destroy, @usuario_curso
    @usuario_curso.destroy
    respond_to do |format|
      format.html { redirect_to usuario_curso_index_url, notice: 'Usuário do Curso excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_curso
      @usuario_curso = UsuarioCurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_curso_params
      params.require(:usuario_curso).permit(:perfil, :nickname, :usuario_id, :curso_id)
    end
end
