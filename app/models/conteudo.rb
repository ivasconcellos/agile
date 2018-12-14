class Conteudo < ApplicationRecord
  validates_presence_of :nome, :curso_id
  belongs_to :curso
  has_many :materiais, :dependent => :destroy, :dependent => :restrict_with_error
  has_many :explicacoes, :dependent => :destroy, :dependent => :restrict_with_error
  has_many :tarefas, :dependent => :destroy, :dependent => :restrict_with_error
  self.per_page = 10
end
