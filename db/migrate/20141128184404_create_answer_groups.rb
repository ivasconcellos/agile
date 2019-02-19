class CreateAnswerGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_groups do |t|

      t.references :question_group
      t.references :usuario_curso, polymorphic: true

      t.timestamps
    end
    
    
  end
end
