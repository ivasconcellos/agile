module QuizRespostasAlunosHelper

	def resposta_correta(resposta)
		if resposta.correta?
			('<i class="fa fa-check-circle text-success"> ' +  strip_tags(resposta.descricao) + ' - Correta!' + '</i>' ).html_safe
		else
			('<i class="fa fa-exclamation-circle text-danger"> ' +  strip_tags(resposta.descricao) + ' - Incorreta!' +'</i>').html_safe
    	end
	end

	def minha_nota_quiz(quiz, aluno)
		@pontuacao = QuizRespostaAluno.joins(quiz_pergunta_resposta: :quiz_pergunta).where(
			'usuario_curso_id =? and quiz_perguntas.quiz_id =? and 
			quiz_pergunta_respostas.correta = ?', 
			aluno, quiz, true).sum('quiz_perguntas.pontuacao')
		if @pontuacao == 0.0
			return '-'
		else
			return @pontuacao
		end
  	end

  	def respondido_quiz(quiz, aluno)
  		@quiz = QuizRespostaAluno.joins(quiz_pergunta_resposta: :quiz_pergunta).where(
			'usuario_curso_id =? and quiz_perguntas.quiz_id =?', 
			aluno, quiz)
  		if !@quiz.empty?
  			return "Sim"
  		else
  			return "Não"
  		end
  	end
end
