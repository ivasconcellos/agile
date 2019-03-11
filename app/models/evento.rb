class Evento < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :curso

  validates_presence_of :nome, :descricao, :data, :hora
  
  self.per_page = 10
end
