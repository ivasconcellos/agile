class Email < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :destinatario
end
