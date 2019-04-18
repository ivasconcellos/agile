class CreateFaqs < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs do |t|
      t.string :pergunta
      t.text :resposta

      t.timestamps
    end
  end
end
