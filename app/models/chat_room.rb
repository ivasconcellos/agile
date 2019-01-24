class ChatRoom < ApplicationRecord
  belongs_to :usuario
  has_many :mensagens, dependent: :destroy
end
