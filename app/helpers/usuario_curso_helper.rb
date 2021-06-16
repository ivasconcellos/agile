module UsuarioCursoHelper

    def pontuacao usuario
        @pontuacao_tarefas = TarefaAluno.joins(:tarefa_avaliacao).where('tarefa_alunos.usuario_curso_id = ?', usuario.id).sum(:nota)
        @pontuacao_quizzes = QuizRespostaAluno.joins(:quiz_pergunta_resposta, :quiz_pergunta).where('quiz_respostas_alunos.usuario_curso_id = ? and quiz_pergunta_respostas.correta =? ', usuario.id, true).sum('quiz_perguntas.pontuacao')
        @pontuacao_total = @pontuacao_tarefas + @pontuacao_quizzes

        return  "%g" % ("%.2f" % @pontuacao_total)
    end
end
