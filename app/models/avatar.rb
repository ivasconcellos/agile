class Avatar < ApplicationRecord
  belongs_to :tema_curso
  validates_presence_of :nome, :tema_curso_id, :imagem
  has_attached_file :imagem, styles: {medium: "300x300", thumb:"100x100"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imagem, content_type: ["image/png", "image/jpg", "image/jpeg"], message: "Tipo de arquivo não permitido(Escolha um arquivo png ou jpg)"
end
