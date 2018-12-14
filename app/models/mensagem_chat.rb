class MensagemChat < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :sala_chat
  validates :texto, presence: true, length: {minimum: 2, maximum: 1000}
  after_create_commit { MessagemBroadcastJob.perform_later(self) }
end
