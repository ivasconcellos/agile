require "application_system_test_case"

class AvaliacaoTarefasTest < ApplicationSystemTestCase
  setup do
    @avaliacao_tarefa = avaliacao_tarefa(:one)
  end

  test "visiting the index" do
    visit avaliacao_tarefa_url
    assert_selector "h1", text: "Avaliacao Tarefas"
  end

  test "creating a Avaliacao tarefa" do
    visit avaliacao_tarefa_url
    click_on "New Avaliacao Tarefa"

    fill_in "Comentario", with: @avaliacao_tarefa.comentario
    fill_in "Nota", with: @avaliacao_tarefa.nota
    fill_in "Tarefa Aluno", with: @avaliacao_tarefa.tarefa_aluno_id
    fill_in "Usuario Curso", with: @avaliacao_tarefa.usuario_curso_id
    click_on "Create Avaliacao tarefa"

    assert_text "Avaliacao tarefa was successfully created"
    click_on "Back"
  end

  test "updating a Avaliacao tarefa" do
    visit avaliacao_tarefa_url
    click_on "Edit", match: :first

    fill_in "Comentario", with: @avaliacao_tarefa.comentario
    fill_in "Nota", with: @avaliacao_tarefa.nota
    fill_in "Tarefa Aluno", with: @avaliacao_tarefa.tarefa_aluno_id
    fill_in "Usuario Curso", with: @avaliacao_tarefa.usuario_curso_id
    click_on "Update Avaliacao tarefa"

    assert_text "Avaliacao tarefa was successfully updated"
    click_on "Back"
  end

  test "destroying a Avaliacao tarefa" do
    visit avaliacao_tarefa_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Avaliacao tarefa was successfully destroyed"
  end
end
