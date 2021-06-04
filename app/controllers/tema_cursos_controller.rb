class TemaCursosController < ApplicationController
  before_action :set_tema_curso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_any!

  # GET /temas_cursos
  # GET /temas_cursos.json
  def index
    authorize! :index, TemaCurso
    @q = TemaCurso.ransack(params[:q])
    @tema_cursos = @q.result.paginate(page: params[:page]).order('nome')
  end

  # GET /temas_cursos/1
  # GET /temas_cursos/1.json
  def show
    authorize! :show, TemaCurso
    @artefatos = Artefato.where(tema_curso_id: @tema_curso.id)
  end

  # GET /temas_cursos/new
  def new
    authorize! :new, TemaCurso
    @tema_curso = TemaCurso.new
  end

  # GET /temas_cursos/1/edit
  def edit
    authorize! :edit, TemaCurso
  end

  # POST /temas_cursos
  # POST /temas_cursos.json
  def create
    @tema_curso = TemaCurso.new(tema_curso_params)

    respond_to do |format|
      if @tema_curso.save
        format.html { redirect_to @tema_curso, notice: 'Tema do curso criado com sucesso!' }
        format.json { render :show, status: :created, location: @tema_curso }
      else
        format.html { render :new }
        format.json { render json: @tema_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temas_cursos/1
  # PATCH/PUT /temas_cursos/1.json
  def update
    respond_to do |format|
      if @tema_curso.update(tema_curso_params)
        format.html { redirect_to @tema_curso, notice: 'Tema do curso atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @tema_curso }
      else
        format.html { render :edit }
        format.json { render json: @tema_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temas_cursos/1
  # DELETE /temas_cursos/1.json
  def destroy
    authorize! :destroy, TemaCurso
    respond_to do |format|
      if @tema_curso.destroy
        format.html { redirect_to temas_cursos_url, notice: 'Tema do curso excluído com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to temas_cursos_url, notice: 'O Tema do curso não pôde ser excluído, pois está sendo utilizado!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tema_curso
      @tema_curso = TemaCurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tema_curso_params
      params.require(:tema_curso).permit(:nome, :ativo, :cor_titulo, :cor_texto, :cor_fundo, :imagem)
    end
end
