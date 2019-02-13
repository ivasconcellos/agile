class PerguntaQuiz < ApplicationRecord
  belongs_to :quiz
  has_many :respostas_perguntas

  self.per_page = 10
  validates_presence_of :descricao
end
