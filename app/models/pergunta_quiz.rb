class PerguntaQuiz < ApplicationRecord
  belongs_to :quiz
  has_many :respostas_perguntas
  validates_presence_of :descricao, :pontuacao

  validate :verificar_pontuacao_maxima

  private

  def verificar_pontuacao_maxima
  		soma = PerguntaQuiz.where(quiz_id: self.quiz.id).sum(pontuacao)
		if (self.pontuacao + soma) > self.quiz.missao.pontuacao
			errors.add(:pontuacao, " - Pontuação da Pergunta ultrapassa a pontuação máxima estabelecida para a Missão!")
		end
	end
end
