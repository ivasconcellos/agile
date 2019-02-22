class Question < ActiveRecord::Base
	belongs_to :question_group, :inverse_of => :questions
	has_many :answers, :dependent=>:destroy

	default_scope { order(:position) }
	validates :question_group_id,  :presence => true
	validates_presence_of :pergunta, :tipo, :message => "- Deve ser preenchido!"
	serialize :validation_rules
	

	def options
		respostas.split(Rapidfire.answers_delimiter)
	end

	def self.inherited(child)
		child.instance_eval do
			def model_name
				Question.model_name
			end
		end

		super
	end

	def rules
		validation_rules || {}
	end

	def validate_answer(answer)
		if rules[:presence] == "1"
			answer.validates_presence_of :resposta
		end

		if rules[:minimum].present? || rules[:maximum].present?
			min_max = { minimum: rules[:minimum].to_i }
			min_max[:maximum] = rules[:maximum].to_i if rules[:maximum].present?
			answer.validates_length_of :resposta, min_max
		end
	end
end