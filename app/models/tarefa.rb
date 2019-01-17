class Tarefa < ApplicationRecord
  belongs_to :modulo
  belongs_to :usuario_curso
  has_many :tarefa_alunos

  self.per_page = 10

  validates_presence_of :nome, :descricao, :pontuacao
  validates_inclusion_of :pontuacao, :in => 1..100, message: " - A pontuação deve ser entre 1 e 100"

end
