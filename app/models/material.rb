class Material < ApplicationRecord
  belongs_to :conteudo
  validates_presence_of :nome
  self.per_page = 10
  has_attached_file :arquivo, styles: {medium: "300x300", thumb:"100x100"}, default_url: "/images/:style/missing.png"
  has_attached_file :imagem, styles: {medium: "300x300", thumb:"100x100"}, default_url: "/images/:style/missing.png"
  has_attached_file :video, styles: {medium: "300x300", thumb:"100x100"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imagem, content_type: ["image/png", "image/jpg", "image/jpeg"] , message: "Tipo de arquivo não permitido. Escolha um arquivo png ou jpg!"
  validates_attachment_content_type :video, content_type: ["video/x-flv", "video/mp4", "video/quicktime", "video/x-msvideo", "video/x-ms-wmv"] , message: "Tipo de arquivo não permitido!"
  validates_attachment_content_type :arquivo, content_type: [
  	"application/pdf", "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
    "application/vnd.oasis.opendocument.text",
    "application/vnd.ms-excel",
    "application/vnd.ms-office",
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "application/vnd.oasis.opendocument.spreadsheet"], message: "Tipo de arquivo não permitido!"
   validates_attachment_size :arquivo, :less_than => 7.megabytes
   validates_attachment_size :imagem, :less_than => 7.megabytes
   validates_attachment_size :video, :less_than => 7.megabytes
end

