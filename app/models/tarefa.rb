class Tarefa < ApplicationRecord
  belongs_to :modulo
  belongs_to :usuario_curso
  has_many :tarefa_alunos, :dependent => :destroy, :dependent => :restrict_with_error

  self.per_page = 10

  validates_presence_of :nome, :descricao, :pontuacao
  validates_inclusion_of :pontuacao, :in => 0..100, message: " - A pontuação deve ser entre 1 e 100"

end
