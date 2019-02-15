class GruposCursosController < ApplicationController
  before_action :set_grupo_curso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /grupos_cursos
  # GET /grupos_cursos.json
  def index
    @grupos_cursos = GrupoCurso.page(params[:page]).order('nome_curso')
    authorize! :index, GrupoCurso
  end

  # GET /grupos_cursos/1
  # GET /grupos_cursos/1.json
  def show
    authorize! :show, GrupoCurso
  end

  # GET /grupos_cursos/new
  def new
    @grupo_curso = GrupoCurso.new
    @grupo_curso.curso_id = current_usuario.curso_atual.id
    authorize! :new, GrupoCurso
  end

  # GET /grupos_cursos/1/edit
  def edit
    authorize! :edit, GrupoCurso
  end

  # POST /grupos_cursos
  # POST /grupos_cursos.json
  def create
    @grupo_curso = GrupoCurso.new(grupo_curso_params)

    respond_to do |format|
      if @grupo_curso.save
        format.html { redirect_to @grupo_curso, notice: 'Grupo do curso cadastrado com sucesso!' }
        format.json { render :show, status: :created, location: @grupo_curso }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @grupo_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupos_cursos/1
  # PATCH/PUT /grupos_cursos/1.json
  def update
    respond_to do |format|
      if @grupo_curso.update(grupo_curso_params)
        format.html { redirect_to @grupo_curso, notice: 'Grupo do curso atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @grupo_curso }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @grupo_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos_cursos/1
  # DELETE /grupos_cursos/1.json
  def destroy
    authorize! :destroy, GrupoCurso
    @grupo_curso.destroy
    respond_to do |format|
      format.html { redirect_to grupos_cursos_url, notice: 'Grupo do curso excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  def lista_participantes
    @usuario = UsuarioCurso.find_by(curso_id: current_usuario.curso_atual, usuario_id: current_usuario.id)
    @lista_participantes = UsuarioCurso.where(grupo_curso_id: @usuario.grupo_curso_id).page(params[:page]).order('nickname')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo_curso
      @grupo_curso = GrupoCurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupo_curso_params
      params.require(:grupo_curso).permit(:grupo_id, :curso_id, :nome_curso)
    end
end
