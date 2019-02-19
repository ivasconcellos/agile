class CreateQuestionGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :question_groups do |t|
		t.string  :titulo
		t.text :descricao
		t.text :objetivo
		t.belongs_to :usuario_curso
      t.timestamps
    end
  end
end
