class AddFinalCursoToQuestionGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :question_groups, :final_curso, :boolean, default: true
  end
end
