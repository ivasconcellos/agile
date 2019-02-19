class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|

      t.references :answer_group
      t.references :question
      t.text :resposta

      t.timestamps
    end
    
  end
end
