module QuizRespostasAlunosHelper

	def resposta_correta(resposta)
		if resposta.correta?
			('<i class="text-success"> ' + strip_tags(resposta.descricao) + ' - Correta! ' + '<i class="fa fa-check-circle">' +  '</i>' +  '</i>').html_safe
		else
			('<i class="text-danger"> ' +  strip_tags(resposta.descricao) + ' - Incorreta! ' + '<i class="fa fa-exclamation-circle"> ' +'</i>' +  '</i>').html_safe
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
			return "%g" % ("%.2f" % @pontuacao)
		end
  	end

  	def respondido_quiz(quiz, aluno)
  		@perguntas = QuizPergunta.where(quiz_id: quiz).count
  		@respostas = QuizRespostaAluno.joins(quiz_pergunta_resposta: :quiz_pergunta).where(
			'usuario_curso_id =? and quiz_perguntas.id in (?)', 
			aluno, QuizPergunta.select(:id).where(quiz_id: quiz)).count
  		if @perguntas == @respostas
  			return "Sim"
  		else
  			return "Não"
  		end
  	end
end
