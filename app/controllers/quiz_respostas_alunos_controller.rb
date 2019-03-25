class QuizRespostasAlunosController < ApplicationController
  before_action :set_quiz_resposta_aluno, only: [:show]
  before_action :authenticate_usuario!

  # GET /quiz_resposta_alunos/1
  # GET /quiz_resposta_alunos/1.json
  def show
    authorize! :show, QuizRespostaAluno
    @respostas = QuizPerguntaResposta.where(quiz_pergunta_id: @quiz_resposta_aluno.quiz_pergunta_resposta.quiz_pergunta.id).order('id')
    @perguntas = QuizPergunta.where(quiz_id: params[:quiz_id]).order('id').paginate(page: params[:page],:per_page => 1)
  end

  # GET /quiz_resposta_alunos/new
  def new
    authorize! :new, QuizRespostaAluno
    @quiz_resposta_aluno = QuizRespostaAluno.new
    @quiz_resposta_aluno.usuario_curso_id = @perfil.id
    @perguntas = QuizPergunta.where(quiz_id: params[:quiz_id]).first
    if params[:pergunta_id]
      @pergunta = QuizPergunta.where("quiz_id = ? and id > ?",params[:quiz_id], params[:pergunta_id]).first
      if !@pergunta
        respond_to do |format|
          format.html { redirect_to(controller: 'quiz_respostas_alunos', action: 'resultado_final_quiz', usuario_curso_id: @perfil.id, quiz_id: params[:quiz_id]) }
          flash[:notice] = ('Quiz respondido com sucesso!')
        end
      else
        @pergunta
      end
    else
      @pergunta = @perguntas
    end 
    
  end

  # POST /quiz_resposta_alunos
  # POST /quiz_resposta_alunos.json
  def create
    @quiz_resposta_aluno = QuizRespostaAluno.new(quiz_resposta_aluno_params)
    respond_to do |format|
      if @quiz_resposta_aluno.save
        @quiz_resposta_aluno.pontuacao_aluno
        format.html { redirect_to @quiz_resposta_aluno, notice: 'Resposta salva com sucesso!' }
        format.json { render :show, status: :created, location: @quiz_resposta_aluno }
      else
        format.html { render :new }
        format.json { render json: @quiz_resposta_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  def resultado_final_quiz
    authorize! :show, QuizRespostaAluno
    @quiz_resposta_alunos  = QuizRespostaAluno.joins(quiz_pergunta_resposta: :quiz_pergunta).where('usuario_curso_id = ? and  quiz_perguntas.quiz_id = ?',  params[:usuario_curso_id], params[:quiz_id] )
    @missao = @quiz_resposta_alunos.first.quiz_pergunta_resposta.quiz_pergunta.quiz.missao
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_resposta_aluno
      @quiz_resposta_aluno = QuizRespostaAluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_resposta_aluno_params
      params.require(:quiz_resposta_aluno).permit(:usuario_curso_id, :quiz_pergunta_resposta_id)
    end
end
