class TarefaEntregar < ApplicationRecord
  belongs_to :tarefa
  belongs_to :usuario_curso
  has_attached_file :arquivo,  default_url: "/images/:style/missing.png"
  validates_attachment_content_type :arquivo, content_type: [
  "application/pdf"], message: "Tipo de arquivo não permitido!"
  validates_attachment_size :arquivo, :less_than => 7.megabytes

end
