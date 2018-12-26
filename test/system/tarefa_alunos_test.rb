require "application_system_test_case"

class TarefaAlunosTest < ApplicationSystemTestCase
  setup do
    @tarefa_aluno = tarefa_alunos(:one)
  end

  test "visiting the index" do
    visit tarefa_alunos_url
    assert_selector "h1", text: "Tarefa Alunos"
  end

  test "creating a Tarefa aluno" do
    visit tarefa_alunos_url
    click_on "New Tarefa Aluno"

    fill_in "Comentario", with: @tarefa_aluno.comentario
    fill_in "Nota", with: @tarefa_aluno.nota
    fill_in "Tarefa", with: @tarefa_aluno.tarefa_id
    fill_in "Usuario Curso", with: @tarefa_aluno.usuario_curso
    fill_in "Usuario Curso", with: @tarefa_aluno.usuario_curso_id
    click_on "Create Tarefa aluno"

    assert_text "Tarefa aluno was successfully created"
    click_on "Back"
  end

  test "updating a Tarefa aluno" do
    visit tarefa_alunos_url
    click_on "Edit", match: :first

    fill_in "Comentario", with: @tarefa_aluno.comentario
    fill_in "Nota", with: @tarefa_aluno.nota
    fill_in "Tarefa", with: @tarefa_aluno.tarefa_id
    fill_in "Usuario Curso", with: @tarefa_aluno.usuario_curso
    fill_in "Usuario Curso", with: @tarefa_aluno.usuario_curso_id
    click_on "Update Tarefa aluno"

    assert_text "Tarefa aluno was successfully updated"
    click_on "Back"
  end

  test "destroying a Tarefa aluno" do
    visit tarefa_alunos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tarefa aluno was successfully destroyed"
  end
end
