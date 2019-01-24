class Mensagem < ApplicationRecord
  belongs_to :sala_chat
  belongs_to :usuario

  validates :texto, presence: true, length: {minimum: 2, maximum: 1000}

  after_create_commit { MensagemBroadcastJob.perform_later(self) }
end
