class SalaChat < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :curso
  has_many :mensagens_chats, dependent: :destroy
end
