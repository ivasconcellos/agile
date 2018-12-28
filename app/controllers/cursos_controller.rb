class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /cursos
  # GET /cursos.json
  def index
    @cursos = Curso.all.page(params[:page]).order('nome')
    authorize! :index, @cursos
    render layout: 'neutro'
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
    authorize! :show, @curso
    render layout: 'neutro'
  end

  def descricao
    @curso = Curso.find(current_usuario.curso_atual_id)
    @modulos = Modulo.where(curso_id: current_usuario.curso_atual_id, publico: true)
    @materiais = Material.joins(:modulo).where('modulos.curso_id = ?',
    current_usuario.curso_atual_id).order('updated_at')
    authorize! :show, @curso
  end

  # GET /cursos/new
  def new
    @curso = Curso.new
    authorize! :new, @curso
    render layout: 'neutro'
  end

  # GET /cursos/1/edit
  def edit
    authorize! :edit, @curso
  end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = Curso.new(curso_params)
    respond_to do |format|
      if @curso.save
        UsuarioCurso.create!(perfil: 'Professor', nickname: @curso.proprietario.nome, usuario_id: @curso.proprietario_id, curso_id: @curso.id)
        current_usuario.update(curso_atual_id: @curso.id)
        format.html { redirect_to @curso, notice: 'Curso criado com sucesso!' }
        format.json { render :show, status: :created, location: @curso }
      else
        format.html { render :new,  layout: 'neutro' }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to @curso, notice: 'Curso atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @curso }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    authorize! :destroy, @curso
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to cursos_url, notice: 'Curso excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  def atualizar_curso_atual
    current_usuario.update(curso_atual_id: params[:curso_id])
    redirect_to :controller => "cursos", :action => "descricao", id: params[:curso_id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:nome, :descricao, :data_inicio, :data_termino, :ativo,
       :tema_curso_id, :proprietario_id, :codigo_acesso, :publico)
    end
end
