module TarefaAlunosHelper

	def avaliada(tarefa, usuario)
        @tarefa = TarefaAluno.find_by("tarefa_id = ? and usuario_curso_id = ?", tarefa, usuario)
		if @tarefa
            return "Sim"
        else
            return "Não"
        end
    end
    
	def enviada(tarefa, usuario)
		@tarefa = TarefaAluno.find_by("tarefa_id = ? and usuario_curso_id = ?", tarefa, usuario)
		if @tarefa
			return "Sim"
		else
			return "Não"
		end
	end
end
