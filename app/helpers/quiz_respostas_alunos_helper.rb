module QuizRespostasAlunosHelper

	def resposta_correta(resposta)
		if resposta.correta?
			('<i class="fa fa-check-circle text-success"> ' +  resposta.descricao + ' - Correta!' + '</i>' ).html_safe
		else
			('<i class="fa fa-exclamation-circle text-danger"> ' +  resposta.descricao + ' - Incorreta!' +'</i>').html_safe
    	end
	end

	def minha_nota_quiz(quiz, aluno)
		QuizRespostaAluno.joins(quiz_pergunta_resposta: :quiz_pergunta).where(
			'usuario_curso_id =? and quiz_perguntas.quiz_id =? and 
			quiz_pergunta_respostas.correta = ?', 
			aluno, quiz, true).sum('quiz_perguntas.pontuacao')
  	end

  	def respondido_quiz(quiz, aluno)
  		@quiz = QuizRespostaAluno.joins(quiz_pergunta_resposta: :quiz_pergunta).where(
			'usuario_curso_id =? and quiz_perguntas.quiz_id =?', 
			aluno, quiz)
  		if !@quiz.empty?
  			return 'Sim'
  		else
  			return 'Não'
  		end
  	end
end
