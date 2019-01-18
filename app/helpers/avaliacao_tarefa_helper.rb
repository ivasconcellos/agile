module AvaliacaoTarefaHelper
	def minha_nota(tarefa, usuario)
		@avaliacao = AvaliacaoTarefa.joins(:tarefa_aluno).find_by(
			"tarefa_alunos.tarefa_id = ? and tarefa_alunos.usuario_curso_id = ?", tarefa, usuario)
		if @avaliacao
			return @avaliacao.nota
		else
			return "0.0"
		end
	end
end
