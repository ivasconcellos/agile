class TemasCursosController < ApplicationController
  before_action :set_tema_curso, only: [:show, :edit, :update, :destroy]

  # GET /temas_cursos
  # GET /temas_cursos.json
  def index
    @temas_cursos = TemaCurso.all
  end

  # GET /temas_cursos/1
  # GET /temas_cursos/1.json
  def show
  end

  # GET /temas_cursos/new
  def new
    @tema_curso = TemaCurso.new
  end

  # GET /temas_cursos/1/edit
  def edit
  end

  # POST /temas_cursos
  # POST /temas_cursos.json
  def create
    @tema_curso = TemaCurso.new(tema_curso_params)

    respond_to do |format|
      if @tema_curso.save
        format.html { redirect_to @tema_curso, notice: 'Tema curso was successfully created.' }
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
        format.html { redirect_to @tema_curso, notice: 'Tema curso was successfully updated.' }
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
    @tema_curso.destroy
    respond_to do |format|
      format.html { redirect_to temas_cursos_url, notice: 'Tema curso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tema_curso
      @tema_curso = TemaCurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tema_curso_params
      params.require(:tema_curso).permit(:nome, :ativo, :cor_titulo, :cor_texto, :cor_fundo)
    end
end
