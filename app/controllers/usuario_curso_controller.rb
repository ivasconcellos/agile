class UsuarioCursoController < ApplicationController
  before_action :set_usuario_curso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  
  # GET /usuario_curso
  # GET /usuario_curso.json
  def index
    @usuario_curso = UsuarioCurso.where(curso_id: current_usuario.curso_atual_id).page(params[:page])
    authorize! :index, UsuarioCurso
  end

  # GET /usuario_curso/1
  # GET /usuario_curso/1.json
  def show
    authorize! :show, UsuarioCurso
  end

  # GET /usuario_curso/new
  def new
    authorize! :new, UsuarioCurso
    @usuario_curso = UsuarioCurso.new
    @usuario_curso.curso_id = params[:curso_id]
  end

  # GET /usuario_curso/1/edit
  def edit
    authorize! :edit, UsuarioCurso
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
        format.html { render :new, @current_usuario => current_usuario }
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
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @usuario_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario_curso/1
  # DELETE /usuario_curso/1.json
  def destroy
    authorize! :destroy, UsuarioCurso
    @usuario_curso.destroy
    respond_to do |format|
      format.html { redirect_to usuario_curso_index_url, notice: 'Usuário do Curso excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  def meu_perfil
    @usuario_curso = UsuarioCurso.where(usuario_id: current_usuario.id, curso_id: current_usuario.curso_atual_id).first
    @badges = BadgeAluno.where(usuario_curso_id: @usuario_curso.id) 
    @artefatos = ArtefatoAluno.where(usuario_curso_id: @usuario_curso.id) 
    authorize! :show, UsuarioCurso
  end

  def busca_curso
    if not params[:codigo_acesso]
      render layout: 'neutro'
    else
      @curso = Curso.where(codigo_acesso: params[:codigo_acesso]).first
      respond_to do |format|
        if not @curso.blank?
          @usuario_curso = UsuarioCurso.new(perfil: 'Aluno', nickname: current_usuario.nome, usuario_id: current_usuario.id, curso_id: @curso.id)
          if @usuario_curso.save
            format.html { redirect_to @usuario_curso, @current_usuario => current_usuario, notice: 'Usuário do Curso cadastrado com sucesso!' }
            format.json { render :show, status: :created, location: @usuario_curso }
          else
            format.html { render :busca_curso, @current_usuario => current_usuario, layout: 'neutro' }
            format.json { render json: @usuario_curso.errors, status: :unprocessable_entity }
          end
        else
          format.html { redirect_to busca_curso_path, alert: 'Curso não encontrado!' }
        end
      end
    end
  end

  def inscricao_curso
    @usuario_curso = UsuarioCurso.new(perfil: 'Aluno', nickname: current_usuario.nome, usuario_id: current_usuario.id, curso_id: current_usuario.curso_atual_id)
    if @usuario_curso.save
      flash[:notice] = 'Usuário do Curso cadastrado com sucesso!'
      redirect_to :controller => "cursos", :action => "show", id: current_usuario.curso_atual_id
    else
      format.html { render :busca_curso, @current_usuario => current_usuario, layout: 'neutro' }
      format.json { render json: @usuario_curso.errors, status: :unprocessable_entity }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_curso
      @usuario_curso = UsuarioCurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_curso_params
      params.require(:usuario_curso).permit(:perfil, :nickname, :usuario_id, :curso_id, :avatar_id, :grupo_curso_id, :nivel_id)
    end
end
