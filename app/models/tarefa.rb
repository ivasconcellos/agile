class Tarefa < ApplicationRecord
  belongs_to :missao
  belongs_to :usuario_curso

  has_many :tarefa_alunos, :dependent => :destroy, :dependent => :restrict_with_error

  self.per_page = 10

  validates_presence_of :nome, :descricao	

end
