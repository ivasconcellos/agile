class Missao < ApplicationRecord
  belongs_to :modulo
  belongs_to :usuario_curso
  has_many :tarefas, :dependent => :destroy, :dependent => :restrict_with_error

  has_one_attached :imagem
  validates :imagem, size: { less_than: 10.megabytes , message: 'Imagem muito grande. Máximo de 10 MB.' }

  validates_presence_of :nome, :descricao, :tipo, :pontuacao

  validates_inclusion_of :pontuacao, :in => 0..100, message: " - A pontuação deve ser entre 1 e 100"
  
  self.per_page = 10
end
