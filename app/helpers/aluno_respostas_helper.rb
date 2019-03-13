module AlunoRespostasHelper

	def resposta_correta(resposta)
		if resposta.correta?
			('<i class="fa fa-check-circle text-success"> ' +  resposta.descricao + ' - Correta!' + '</i>' ).html_safe
		else
			('<i class="fa fa-exclamation-circle text-danger"> ' +  resposta.descricao + ' - Incorreta!' +'</i>').html_safe
    	end
	end

	def minha_nota_quiz(quiz, aluno)
		AlunoResposta.joins(resposta_pergunta: :pergunta_quiz).where(
			'usuario_curso_id =? and perguntas_quiz.quiz_id =? and 
			respostas_perguntas.correta = ?', 
			aluno, quiz, true).sum('perguntas_quiz.pontuacao')
  	end

  	def respondido_quiz(quiz, aluno)
  		@quiz = AlunoResposta.joins(resposta_pergunta: :pergunta_quiz).where(
			'usuario_curso_id =? and perguntas_quiz.quiz_id =?', 
			aluno, quiz)
  		if !@quiz.empty?
  			return 'Sim'
  		else
  			return 'Não'
  		end
  	end
end
