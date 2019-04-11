class AddPublicoAlvoAndCriteriosParticipacaoToCursos < ActiveRecord::Migration[5.2]
  def change
    add_column :cursos, :publico_alvo, :text
    add_column :cursos, :criterios_participacao, :text
  end
end
