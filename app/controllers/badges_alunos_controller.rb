class BadgesAlunosController < ApplicationController
  before_action :authenticate_usuario!
  # GET /badges_alunos
  # GET /badges_alunos.json
  def index
    @badges_alunos = BadgeAluno.paginate(page: params[:page])
    authorize! :index, BadgeAluno
  end

  # GET /badges_alunos/new
  def new
    @badge_aluno = BadgeAluno.new
    authorize! :new, BadgeAluno
  end

  # POST /badges_alunos
  # POST /badges_alunos.json
  def create
    @badge_aluno = BadgeAluno.new(badge_aluno_params)

    respond_to do |format|
      if @badge_aluno.save
        ApplicationMailer.nova_badge(@badge_aluno).deliver
        format.html { redirect_to @badge_aluno, notice: 'Parabéns! Você recebeu uma nova Badge!' }
        format.json { render :show, status: :created, location: @badge_aluno }
      else
        format.html { render :new }
        format.json { render json: @badge_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_aluno_params
      params.require(:badge_aluno).permit(:usuario_curso_id, :badges_id)
    end
end
