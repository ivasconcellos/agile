class Quiz < ApplicationRecord
  belongs_to :missao
  belongs_to :usuario_curso

  self.per_page = 10

  validates_presence_of :nome, :descricao

  def pontuacao
  	@pontuacao_missao = Missao.select(:pontuacao).joins(:quiz).find_by('quizes.id =?', self.id)
  	@pontuacao_perguntas = PerguntaQuiz.where(quiz_id: self.id).sum('pontuacao')
  	if @pontuacao_missao.pontuacao > @pontuacao_perguntas
  		return true
  	end
  end

end
