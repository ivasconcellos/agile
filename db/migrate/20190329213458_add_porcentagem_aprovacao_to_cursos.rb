class AddPorcentagemAprovacaoToCursos < ActiveRecord::Migration[5.2]
  def change
    add_column :cursos, :porcentagem_aprovacao, :integer
  end
end
