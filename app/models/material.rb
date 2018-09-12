class Material < ApplicationRecord
  belongs_to :conteudo
  validates_presence_of :nome
  self.per_page = 10
  has_attached_file :arquivo, styles: {medium: "300x300", thumb:"100x100"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :arquivo, content_type: ["image/png", "image/jpg", "image/jpeg",
  	"application/pdf", "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
    "application/vnd.oasis.opendocument.text",
    "application/vnd.ms-excel",
    "application/vnd.ms-office",
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "application/vnd.oasis.opendocument.spreadsheet"], message: "Tipo de arquivo não permitido(Escolha um arquivo png ou jpg)"
   validates_attachment_size :arquivo, :less_than => 7.megabytes
end
