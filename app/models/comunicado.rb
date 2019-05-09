class Comunicado < ApplicationRecord
	belongs_to :curso
	belongs_to :remetente, class_name: "UsuarioCurso" 

	validates_presence_of :assunto, :mensagem

	self.per_page = 10
end
