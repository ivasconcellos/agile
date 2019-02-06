class PerguntaQuiz < ApplicationRecord
  belongs_to :quiz

  self.per_page = 10
  validates_presence_of :descricao
end
