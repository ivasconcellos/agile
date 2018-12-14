class UsuarioCurso < ApplicationRecord
	validates_presence_of :perfil, :nickname, :avatar_id
	belongs_to :curso
	belongs_to :usuario
	belongs_to :avatar
	has_many :salas_chats, dependent: :destroy
	has_many :messagens_chats, dependent: :destroy
	validates_uniqueness_of :usuario_id, scope: :curso_id, message: "já está cadastrado no curso!"
end