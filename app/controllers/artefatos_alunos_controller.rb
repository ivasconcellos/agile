class ArtefatosAlunosController < ApplicationController
  before_action :authenticate_any!

  # GET /artefatos_alunos
  # GET /artefatos_alunos.json
  def index
    authorize! :index, ArtefatoAluno
    @q = ArtefatoAluno.ransack(params[:q])
    @artefatos_alunos = @q.result.paginate(page: params[:page])
  end

  private
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def artefato_aluno_params
      params.require(:artefato_aluno).permit(:usuario_curso_id, :artefato_id)
    end
end
