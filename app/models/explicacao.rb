class Explicacao < ApplicationRecord
  belongs_to :modulo
  validates_presence_of :nome
  self.per_page = 10
end
