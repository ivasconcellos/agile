class Evento < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :curso

  validates_presence_of :nome, :descricao, :data, :hora
  
  self.per_page = 10

  def data_hora
    self.data.strftime("%d/%m/%Y") + " - " + self.hora.strftime("%H:%M")
  end

  def evento_no_prazo

	data_hora = (self.data.to_s + " " +  self.hora.to_s).to_datetime

	if data_hora > DateTime.now 
		return true
	else
		return false
	end
 
  end
end
