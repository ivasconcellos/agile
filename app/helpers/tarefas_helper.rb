module TarefasHelper
	def no_prazo(tarefa)
		if tarefa.data_limite and tarefa.hora_limite
			limite = (tarefa.data_limite.to_s + " " +  tarefa.hora_limite.to_s).to_datetime

			if limite >= DateTime.now
				return true
	    	else
	    		return false
	    	end
	    end
	end
end
