class QuizPergunta < ApplicationRecord
  belongs_to :quiz
  has_many :quiz_pergunta_respostas
  validates_presence_of :descricao, :pontuacao

  validates :pontuacao, numericality: true

  validate :verificar_pontuacao_maxima

  private

  def verificar_pontuacao_maxima
    
    if self.pontuacao
      if self.id
        soma = QuizPergunta.where('quiz_id =? and id != ?',self.quiz.id, self.id).sum('pontuacao')
      else
        soma = QuizPergunta.where('quiz_id =?',self.quiz.id).sum('pontuacao')
      end
  		if (self.pontuacao + soma) > self.quiz.missao.pontuacao
  			errors.add(:pontuacao, " - Pontuação da Pergunta ultrapassa a pontuação máxima estabelecida para a Missão!")
  		end
    end
	end
end
