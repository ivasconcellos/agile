module ApplicationHelper
	def render_answer_form_helper(answer, form)
		partial = answer.question.tipo.to_s.split("::").last.downcase
		render partial: "answers/#{partial}", locals: { f: form, answer: answer }
	end

	def checkbox_checked?(answer, option)
        answers_delimiter = Rapidfire.answers_delimiter
        answers = answer.resposta.to_s.split(answers_delimiter)
        answers.include?(option)
    end

    def no_prazo(objeto)
		
		data_hora_inicio = (objeto.data_inicio.to_s + " " +  objeto.hora_inicio.to_s).to_datetime
		data_hora_termino = (objeto.data_termino.to_s + " " +  objeto.hora_termino.to_s).to_datetime
		if DateTime.now >= data_hora_inicio and data_hora_termino >= DateTime.now
			return true
    	else
    		return false
    	end
	    
	end

	def formata_pontos(pontos)
		return "%g" % ("%.2f" % pontos)
	end

end
