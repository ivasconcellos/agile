class Quiz < ApplicationRecord
  belongs_to :curso
  belongs_to :usuario_curso

  self.per_page = 10

  validates_presence_of :nome, :descricao, :max_tentativas
end
