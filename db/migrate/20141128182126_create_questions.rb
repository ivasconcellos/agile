class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string  :tipo
      t.string  :pergunta
      t.integer :position
      t.text :respostas
      t.text :validation_rules
	  t.belongs_to :question_group
      t.timestamps
    end
  end
end
