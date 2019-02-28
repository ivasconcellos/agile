class Quiz < ApplicationRecord
  belongs_to :missao
  belongs_to :usuario_curso

  self.per_page = 10

  validates_presence_of :nome, :descricao, :max_tentativas, :data_inicio, :hora_inicio, :data_termino, :hora_termino

  	def data_hora_inicio
		self.data_inicio.strftime("%d/%m/%Y") + " " + self.hora_inicio.strftime("%H:%M:%S")
	end

	def data_hora_termino
		self.data_termino.strftime("%d/%m/%Y") + " " + self.hora_termino.strftime("%H:%M:%S")
	end
end
