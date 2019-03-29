class AddCursoToQuestionGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :question_groups, :curso, foreign_key: true
  end
end
