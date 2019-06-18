class AtividadeExtra < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :modulo
  has_many :atividade_extra_aluno
  validates_presence_of :pontuacao, :descricao

  after_create :ordenacao
  after_destroy :remocao
  
  def ordenacao
    ModuloOrdenacao.ordenar(self)
  end

  def remocao
    ModuloOrdenacao.remover(self)
  end
end
