class QuizPerguntaResposta < ApplicationRecord
  belongs_to :quiz_pergunta
  has_many :quiz_respostas_alunos
  validates_presence_of :descricao

  validate :existe_correta

  def existe_correta
  	@correta = QuizPerguntaResposta.where(quiz_pergunta_id: self.quiz_pergunta_id, correta: true)
  	if !@correta.empty? and self.correta == true
  		errors.add(:correta, " - Já existe uma resposta correta para esta pergunta!")
  	else
  		return false  		
  	end

  end

end
