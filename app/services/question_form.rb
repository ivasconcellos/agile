class QuestionForm < BaseService
	AVAILABLE_QUESTIONS =
	[
	Questions::Checkbox,
	Questions::Date,
	Questions::Numeric,
	Questions::Radio,
	Questions::Select,
	]
	
	QUESTION_TYPES = AVAILABLE_QUESTIONS.inject({}) do |result, question|
		question_name = question.to_s.split("::").last
		if question_name == 'Checkbox'
			question_name = 'Várias respostas (Checkbox)'
		end
		if question_name == 'Date'
			question_name = 'Data'
		end
		if question_name == 'Numeric'
			question_name = 'Número inteiro'
		end
		if question_name == 'Radio'
			question_name = 'Única resposta (Radio)'
		end
		if question_name == 'Select'
			question_name = 'Seleção de resposta em lista (Select)'
		end

		result[question_name] = question.to_s
		result
	end

	attr_accessor :question_group_id, :question_group, :question,
	:tipo, :pergunta, :respostas,  :answer_presence
	
	delegate :valid?, :errors, :id, :to => :question

	def to_model
		question
	end

	def initialize(params = {})
		from_question_to_attributes(params[:question]) if params[:question]
		super(params)
		@question ||= question_group.questions.new
	end

	def save
		@question.new_record? ? create_question : update_question
	end

	private
	def create_question
		klass = nil
		if QUESTION_TYPES.values.include?(tipo)
		klass = tipo.constantize
		else
		errors.add(:tipo, :invalid)
		return false
		end
		@question = klass.create(to_question_params)
	end

	def update_question
		@question.update_attributes(to_question_params)
	end

	def to_question_params
		{
			:tipo => tipo,
			:question_group => question_group,
			:pergunta => pergunta,
			:respostas => respostas,
			:validation_rules => {
			:presence => answer_presence,
			}
		}
	end

	def from_question_to_attributes(question)
		self.tipo = question.tipo
		self.question_group_id = question.question_group_id
		self.question_group = question.question_group
		self.pergunta = question.pergunta
		self.respostas = question.respostas
		self.answer_presence = question.rules[:presence]
	end
end
