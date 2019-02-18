class Conversa < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :destinatario, class_name: "UsuarioCurso"

  validates_presence_of :assunto, :mensagem
  
  self.per_page = 10
end
