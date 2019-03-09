class AlunoRespostasController < ApplicationController
  before_action :set_aluno_resposta, only: [:show, :edit, :update, :destroy]

  # GET /aluno_respostas/1
  # GET /aluno_respostas/1.json
  def index
    @aluno_respostas = AlunoResposta.all
  end
  def show
    @respostas = RespostaPergunta.where(pergunta_quiz_id: @aluno_resposta.resposta_pergunta.pergunta_quiz.id).order('id')
    @perguntas = PerguntaQuiz.where(quiz_id: params[:quiz_id]).order('id').paginate(page: params[:page],:per_page => 1)
  end

  # GET /aluno_respostas/new
  def new
    @aluno_resposta = AlunoResposta.new
    @aluno_resposta.usuario_curso_id = @perfil.id
    @perguntas = PerguntaQuiz.where(quiz_id: params[:quiz_id]).first
    if params[:pergunta_id]
      @pergunta = PerguntaQuiz.where("quiz_id = ? and id > ?",params[:quiz_id], params[:pergunta_id]).first
      if !@pergunta
        respond_to do |format|
          format.html { redirect_to @aluno_resposta, notice: 'Parabéns!!! Você terminou de responder este Quiz!' }
        end
      else
        @pergunta
      end
    else
      @pergunta = @perguntas
    end 
    
  end

  # POST /aluno_respostas
  # POST /aluno_respostas.json
  def create
    @aluno_resposta = AlunoResposta.new(aluno_resposta_params)
    @perguntas = PerguntaQuiz.where(quiz_id: params[:quiz_id]).paginate(page: params[:page])
    respond_to do |format|
      if @aluno_resposta.save
        format.html { redirect_to @aluno_resposta, notice: 'Resposta salva com sucesso!' }
        format.json { render :show, status: :created, location: @aluno_resposta }
      else
        format.html { render :new }
        format.json { render json: @aluno_resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno_resposta
      @aluno_resposta = AlunoResposta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_resposta_params
      params.require(:aluno_resposta).permit(:usuario_curso_id, :resposta_pergunta_id)
    end
end
