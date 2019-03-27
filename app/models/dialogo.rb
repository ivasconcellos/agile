class Dialogo < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :modulo

  validates_presence_of :titulo, :texto
end
