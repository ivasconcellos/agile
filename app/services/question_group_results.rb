  class QuestionGroupResults < BaseService
    attr_accessor :question_group

    # extracts question along with results
    # each entry will have the following:
    # 1. question type and question id
    # 2. question text
    # 3. if aggregatable, return each option with value
    # 4. else return an array of all the answers given
    def extract
      @question_group.questions.order(:created_at).collect do |question|
        
		
		if question.tipo == "Questions::Radio" || "Questions::Checkbox" ||Questions::Select
			answers = question.answers.map(&:resposta).map do |text|
            	text.to_s.split(Rapidfire.answers_delimiter)
            end.flatten
        	results = answers.inject(Hash.new(0)) { |total, e| total[e] += 1; total }
		else
			results =  question.answers.pluck(:resposta)
		end 

        QuestionResult.new(question: question, results: results)
      end
    end
  end

