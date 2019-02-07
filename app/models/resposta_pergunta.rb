class RespostaPergunta < ApplicationRecord
  belongs_to :pergunta_quiz

  validates_presence_of :descricao
end
