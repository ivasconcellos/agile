class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :descricao, :edit, :update, :destroy]
  before_action :authenticate_any!

  # GET /cursos
  # GET /cursos.json
  def index
    authorize! :index, Curso
    @q = Curso.ransack(params[:q])
    @cursos = @q.result.paginate(page: params[:page]).order('nome')
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
    authorize! :show, Curso
    @curso = Curso.find(current_usuario.curso_atual_id)
    @modulos = Modulo.where(curso_id: current_usuario.curso_atual_id, publico: true)
    @usuario_curso = UsuarioCurso.where(curso_id: @curso.id, usuario_id: current_usuario.id)
    @conversas = Conversa.where(destinatario_id: @perfil.id, lida: false)
  end

  def visualizar_curso
    current_usuario.update(curso_atual_id: params[:id])
    respond_to do |format|
      format.html { redirect_to descricao_path(id: params[:id]) }
    end
  end 
  
  def descricao
    if current_usuario
      current_usuario.update(curso_atual_id: @curso.id)
      @usuario_curso = UsuarioCurso.where(curso_id: @curso.id, usuario_id: current_usuario.id)
    end
  end

  # GET /cursos/new
  def new
    authorize! :new, Curso
    @curso = Curso.new
    char = (?0..?z).grep(/\w/)
    begin
      str = char.shuffle.take(8).join
    end while Curso.exists?( :codigo_acesso => str)
    @curso.codigo_acesso = str
  end

  # GET /cursos/1/edit
  def edit
    authorize! :edit, Curso
  end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = Curso.new(curso_params)
    respond_to do |format|
      if @curso.save
        @usuario_curso = UsuarioCurso.create!(perfil: 'Professor', nickname: @curso.proprietario.nome, usuario_id: @curso.proprietario_id, curso_id: @curso.id, nivel_id: 1)
        ApplicationMailer.cadastro_curso(@usuario_curso).deliver
        format.html { redirect_to descricao_path(id: @curso.id), notice: 'Curso criado com sucesso!' }
        format.json { render :show, status: :created, location: cursos_path }
      else
        format.html { render :new}
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to descricao_path(id: @curso.id), notice: 'Curso atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: cursos_path }
      else
        format.html { render :edit}
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    authorize! :destroy, Curso
    
    respond_to do |format|
      if @curso.destroy
        format.html { redirect_to cursos_url, notice: 'Curso excluído com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to cursos_url, alert: 'O Curso não pôde ser excluído, pois está sendo utilizado!' }
        format.json { head :no_content }
      end
    end
  end

  def atualizar_curso_atual
    current_usuario.update(curso_atual_id: params[:curso_id])
    redirect_to :controller => "cursos", :action => "show", id: params[:curso_id]
  end

  def notas
    authorize! :notas_turma, :curso
    @modulos = Modulo.where('curso_id = ?',
       current_usuario.curso_atual_id)
  end

  def enviar_convite
    authorize! :enviar_convite, :curso
    @curso = @perfil.curso
    if request.post?
      ApplicationMailer.enviar_convite(@curso, params[:emails]).deliver    
      respond_to do |format|
        format.html { redirect_to @curso, notice: 'Convite enviado com sucesso!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:nome, :descricao, :data_inicio, :hora_inicio, :data_termino, :hora_termino, :ativo,
       :tema_curso_id, :proprietario_id, :codigo_acesso, :publico, :carga_horaria, :porcentagem_aprovacao, :publico_alvo, :criterios_participacao)
    end
end
