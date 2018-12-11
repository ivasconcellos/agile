class UsuarioCurso < ApplicationRecord
	validates_presence_of :perfil, :nickname, :avatar_id
	belongs_to :curso
	belongs_to :usuario
	belongs_to :avatar
	validates_uniqueness_of :usuario_id, scope: :curso_id, message: "já está cadastrado no curso!"
end