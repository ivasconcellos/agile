class UsuarioCurso < ApplicationRecord
	validates_presence_of :perfil, :nickname
	belongs_to :curso
	belongs_to :usuario
end
