class TarefaAluno < ApplicationRecord
  belongs_to :tarefa
  belongs_to :usuario_curso
  has_one :avaliacao_tarefa

  self.per_page = 10

  validates :tarefa, uniqueness: { scope: :usuario_curso }
  
  has_attached_file :arquivo, style: {medium: "300x300", thumb:"100x100"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :arquivo, content_type: [
  	"application/pdf", "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
    "application/vnd.oasis.opendocument.text",
    "application/vnd.ms-excel",
    "application/vnd.ms-office",
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "application/vnd.oasis.opendocument.spreadsheet"], message: "Tipo de arquivo não permitido!"
   validates_attachment_size :arquivo, :less_than => 10.megabytes
end
