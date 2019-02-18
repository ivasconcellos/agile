class UsuarioCurso < ApplicationRecord
	validates_presence_of :perfil, :nickname
	belongs_to :curso
	belongs_to :usuario
	belongs_to :avatar, optional: true
	has_many :tarefa_aluno
	belongs_to :usuario
	has_many :salas_chat, dependent: :destroy
	has_many :mensagens, dependent: :destroy
	belongs_to :grupo_curso, optional: true
	belongs_to :nivel, optional: true
	
	validates_uniqueness_of :usuario_id, scope: :curso_id, message: "já está cadastrado no curso!"
end
