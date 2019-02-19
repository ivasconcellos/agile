class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :answer_group, inverse_of: :answers
	validates :question, :answer_group, presence: true
	validate  :verify_answer_text

	private
	def verify_answer_text
      question.validate_answer(self)
    end
end
