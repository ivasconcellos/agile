class SalaChat < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :curso
  has_many :mensagens, dependent: :destroy
  self.per_page = 10
end
