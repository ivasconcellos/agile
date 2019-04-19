class UsuarioCursoController < ApplicationController
  before_action :set_usuario_curso, only: [:show, :edit, :update, :destroy, :escolher_equipe, :cancelar_inscricao, :finalizar_curso, :atualizar_avatar]
  before_action :authenticate_usuario!
  
  # GET /usuario_curso
  # GET /usuario_curso.json
  def index
    @q = UsuarioCurso.where(curso_id: current_usuario.curso_atual_id).ransack(params[:q])
    @usuario_curso = @q.result.paginate(page: params[:page]).order('nickname')
    authorize! :index, UsuarioCurso
  end

  # GET /usuario_curso/1
  # GET /usuario_curso/1.json
  def show
    authorize! :show, UsuarioCurso
    @badges = BadgeAluno.where(usuario_curso_id: @usuario_curso.id) 
    @artefatos = ArtefatoAluno.where(usuario_curso_id: @usuario_curso.id) 
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
    @usuario_curso.nivel_id = 1
    respond_to do |format|
      if @usuario_curso.save
        format.html { redirect_to @usuario_curso, notice: 'Usuário cadastrado no Curso com sucesso!' }
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
    @usuario_curso = UsuarioCurso.new(perfil: 'Aluno', nickname: current_usuario.nome, usuario_id: current_usuario.id, curso_id: current_usuario.curso_atual_id, nivel_id: 1, )
    if @usuario_curso.save
      flash[:notice] = 'Usuário do Curso cadastrado com sucesso!'
      redirect_to :controller => "cursos", :action => "show", id: current_usuario.curso_atual_id
    else
      format.html { render :back }
      format.json { render json: @usuario_curso.errors, status: :unprocessable_entity }
    end
  end

  def notas_aluno
    @aluno = UsuarioCurso.find_by('usuario_curso.id = ? and curso_id = ?',
       params[:aluno_id], params[:curso_id])
    authorize! :notas_aluno,:notas
  end

  def minhas_notas
    @modulos = Modulo.where('modulos.curso_id = ?',
       current_usuario.curso_atual_id)
    authorize! :minhas_notas,:notas
  end

  def ranking_usuario
    @alunos = UsuarioCurso.where(curso_id: current_usuario.curso_atual_id, perfil: 'Aluno').order(pontos_experiencia: :desc).paginate(page: params[:page], per_page: 20)
    authorize! :show, UsuarioCurso
  end

  def atualizar_avatar
    authorize! :edit, UsuarioCurso
  end

  def escolher_equipe
    authorize! :escolher_equipe, UsuarioCurso
  end

  def cancelar_inscricao
    authorize! :cancelar_inscricao, UsuarioCurso
    @usuario_curso.status_curso = 'Inscrição Cancelada'
    if @usuario_curso.save
      flash[:notice] = 'Inscrição no curso Cancelada com sucesso!'
      redirect_to :controller => "cursos", :action => "show", id: current_usuario.curso_atual_id
      ApplicationMailer.inscricao_cancelada(@usuario_curso).deliver
    end
  end

  def finalizar_curso
    authorize! :finalizar_curso, UsuarioCurso
    @usuario_curso.status_curso = 'Curso finalizado'
    @usuario_curso.curso_finalizado = true
    @usuario_curso.aprovado = @usuario_curso.verifica_aprovacao
    if @usuario_curso.save
      flash[:notice] = 'Curso finalizado com sucesso!'
      if @usuario.aprovado = true
        CursoCertificado.create!(usuario_id: current_usuario.id, curso_id: @usuario_curso.curso.id)
      end
    end
    redirect_to :controller => "cursos", :action => "descricao", id: current_usuario.curso_atual_id
  end

  def pendencias
    authorize! :pendencias, UsuarioCurso
    @tarefas = Tarefa.joins(missao: :modulo).where('modulos.curso_id =?', @perfil.curso_id).where.not(id: TarefaAluno.joins(tarefa: [missao: :modulo]).select('tarefa_alunos.tarefa_id').where('modulos.curso_id = ? and tarefa_alunos.usuario_curso_id =?', @perfil.curso_id, @perfil.id))
    @quizzes = Quiz.joins(missao: :modulo).where('modulos.curso_id =?', @perfil.curso_id).where.not(id: QuizRespostaAluno.joins(quiz: [missao: :modulo]).select('quiz_respostas_alunos.quiz_id').where('modulos.curso_id = ? and quiz_respostas_alunos.usuario_curso_id =?', @perfil.curso_id, @perfil.id)).group('quizzes.id')
    @pesquisas = QuestionGroup.where(curso_id: @perfil.curso_id).where.not(id: AnswerGroup.joins(:question_group).select('answer_groups.question_group_id').where('question_groups.curso_id =? and answer_groups.usuario_curso_id =?', @perfil.curso_id, @perfil.id))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_curso
      @usuario_curso = UsuarioCurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_curso_params
      params.require(:usuario_curso).permit(:perfil, :nickname, :pontos_experiencia, :usuario_id, :curso_id, :avatar_id, :grupo_curso_id, :nivel_id, :curso_finalizado, :status_curso, :aprovado)
    end
end
