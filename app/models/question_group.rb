class QuestionGroup < ActiveRecord::Base
	has_many :questions, :dependent=>:destroy 
	validates :titulo, :presence => true
end
