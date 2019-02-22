class QuestionForm < BaseService
	AVAILABLE_QUESTIONS =
	[
	Questions::Checkbox,
	Questions::Date,
	Questions::Long,
	Questions::Numeric,
	Questions::Radio,
	Questions::Select,
	Questions::Short,
	]
	QUESTION_TYPES = AVAILABLE_QUESTIONS.inject({}) do |result, question|
	question_name = question.to_s.split("::").last
	result[question_name] = question.to_s
	result
	end
	attr_accessor :question_group_id, :question_group, :question,
	:tipo, :pergunta, :respostas,  :answer_presence,
	:answer_minimum_length, :answer_maximum_length,
	:answer_greater_than_or_equal_to, :answer_less_than_or_equal_to
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
			:minimum => answer_minimum_length,
			:maximum => answer_maximum_length,
			:greater_than_or_equal_to => answer_greater_than_or_equal_to,
			:less_than_or_equal_to => answer_less_than_or_equal_to
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
		self.answer_minimum_length = question.rules[:minimum]
		self.answer_maximum_length = question.rules[:maximum]
		self.answer_greater_than_or_equal_to = question.rules[:greater_than_or_equal_to]
		self.answer_less_than_or_equal_to = question.rules[:less_than_or_equal_to]
	end
end
