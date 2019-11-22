class BadgesAlunosController < ApplicationController
  before_action :authenticate_any!
  
  # GET /badges_alunos
  # GET /badges_alunos.json
  def index
    authorize! :index, BadgeAluno
    @q = BadgeAluno.ransack(params[:q])
    @badges_alunos = @q.result.paginate(page: params[:page])
  end

  def self.nova_badge(usuario, badge)
    @badge_aluno = BadgeAluno.create!(usuario_curso_id: usuario.id, badge_id: badge.id)
    ApplicationMailer.nova_badge(@badge_aluno).deliver
      respond_to do |format|
        flash.now[:alert] = ("Parabéns!!! Você conquistou uma nova badge!!!")
      end

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_aluno_params
      params.require(:badge_aluno).permit(:usuario_curso_id, :badges_id)
    end
end
