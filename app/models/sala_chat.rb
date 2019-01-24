class SalaChat < ApplicationRecord
  belongs_to :usuario
  belongs_to :curso
  has_many :mensagens, dependent: :destroy
end
