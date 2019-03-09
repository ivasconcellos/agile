class PerguntaQuiz < ApplicationRecord
  belongs_to :quiz
  has_many :respostas_perguntas
  validates_presence_of :descricao, :pontuacao
end
