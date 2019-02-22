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
	
end
