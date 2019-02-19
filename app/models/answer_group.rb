class AnswerGroup < ActiveRecord::Base
	belongs_to :question_group
    belongs_to :usuario_curso, polymorphic: true
    has_many   :answers, inverse_of: :answer_group, autosave: true, :dependent=>:destroy

end
