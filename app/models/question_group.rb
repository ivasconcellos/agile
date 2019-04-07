class QuestionGroup < ActiveRecord::Base
	has_many :questions, :dependent=>:destroy 
	has_many :answer_groups
	validates :titulo, :presence => true
end
