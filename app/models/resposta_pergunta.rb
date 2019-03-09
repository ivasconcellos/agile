class RespostaPergunta < ApplicationRecord
  belongs_to :pergunta_quiz
  has_many :aluno_respostas
  validates_presence_of :descricao
end
