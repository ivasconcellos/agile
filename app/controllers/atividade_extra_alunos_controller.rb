class AtividadeExtraAlunosController < ApplicationController
  before_action :set_atividade_extra_aluno, only: [:show, :edit, :update, :destroy]

  # GET /atividade_extra_alunos
  # GET /atividade_extra_alunos.json
  def index
    @atividade_extra_alunos = AtividadeExtraAluno.where('atividade_extra_id = ?', params[:atividade_extra_id])
    @atividade_extra = params[:atividade_extra_id]
    @usuario_curso =  UsuarioCurso.where(curso_id: current_usuario.curso_atual_id).order(:nickname)
  end

  # GET /atividade_extra_alunos/1
  # GET /atividade_extra_alunos/1.json
  def show
    
  end

  # GET /atividade_extra_alunos/new
  def new
    @atividade_extra_aluno = AtividadeExtraAluno.new
    @atividade_extra_aluno.atividade_extra_id = params[:atividade_extra_id]
    @atividade_extra_aluno.professor_id = @perfil.id
    @atividade_extra_aluno.aluno_id = UsuarioCurso.where('id = ?', params[:usuario_curso_id]).first.id
  end

  # GET /atividade_extra_alunos/1/edit
  def edit
  end

  # POST /atividade_extra_alunos
  # POST /atividade_extra_alunos.json
  def create
    @atividade_extra_aluno = AtividadeExtraAluno.new(atividade_extra_aluno_params)
    respond_to do |format|
      if @atividade_extra_aluno.save
        @atividade_extra_aluno.pontuacao_aluno(nil)
        format.html { redirect_to @atividade_extra_aluno, notice: 'Atividade extra pontuada com sucesso.' }
        format.json { render :show, status: :created, location: @atividade_extra_aluno }
      else
        format.html { render :new }
        format.json { render json: @atividade_extra_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atividade_extra_alunos/1
  # PATCH/PUT /atividade_extra_alunos/1.json
  def update
    respond_to do |format|
      if @atividade_extra_aluno.update(atividade_extra_aluno_params)
        format.html { redirect_to @atividade_extra_aluno, notice: 'Pontuação atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @atividade_extra_aluno }
      else
        format.html { render :edit }
        format.json { render json: @atividade_extra_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atividade_extra_alunos/1
  # DELETE /atividade_extra_alunos/1.json
  def destroy
    @atividade_extra_aluno.destroy
    respond_to do |format|
      format.html { redirect_to atividade_extra_alunos_url, notice: 'Pontuação excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atividade_extra_aluno
      @atividade_extra_aluno = AtividadeExtraAluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atividade_extra_aluno_params
      params.require(:atividade_extra_aluno).permit(:pontuacao, :aluno_id, :professor_id, :atividade_extra_id)
    end
end
