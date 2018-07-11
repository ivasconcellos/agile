class UsuarioCurso < ApplicationRecord
	validates_presence_of :perfil, :nickname
	belongs_to :curso
	belongs_to :usuario
	has_attached_file :avatar, styles: {medium: "300x300", thumb:"100x100"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: ["image/png", "image/jpg"], message: "Tipo de arquivo não permitido(Escolha um arquivo png ou jpg)"
end