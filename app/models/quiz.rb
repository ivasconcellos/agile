class Quiz < ApplicationRecord
  belongs_to :missao
  belongs_to :usuario_curso

  self.per_page = 10

  validates_presence_of :nome, :descricao

end
