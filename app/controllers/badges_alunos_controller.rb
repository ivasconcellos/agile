class BadgesAlunosController < ApplicationController
  before_action :authenticate_usuario!
  
  # GET /badges_alunos
  # GET /badges_alunos.json
  def index
    authorize! :index, BadgeAluno
    @q = BadgeAluno.ransack(params[:q])
    @badges_alunos = @q.result.paginate(page: params[:page])
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_aluno_params
      params.require(:badge_aluno).permit(:usuario_curso_id, :badges_id)
    end
end
