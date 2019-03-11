class UsuarioCurso < ApplicationRecord
	validates_presence_of :perfil, :nickname
	belongs_to :curso
	belongs_to :usuario
	belongs_to :avatar, optional: true
	has_many :tarefa_aluno, :dependent => :destroy, :dependent => :restrict_with_error
	belongs_to :usuario
	has_many :salas_chat, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :mensagens, :dependent => :destroy, :dependent => :restrict_with_error
	belongs_to :grupo_curso, optional: true
	belongs_to :nivel, optional: true
	has_many :missoes, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :foruns, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :comentarios, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :conversas, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :badges_alunos, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :eventos, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :artefatos_alunos, :dependent => :destroy, :dependent => :restrict_with_error

	validates_uniqueness_of :usuario_id, scope: :curso_id, message: "já está cadastrado no curso!"

	self.per_page = 10
end
