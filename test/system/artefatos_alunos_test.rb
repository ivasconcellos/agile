require "application_system_test_case"

class ArtefatoAlunosTest < ApplicationSystemTestCase
  setup do
    @artefato_aluno = artefatos_alunos(:one)
  end

  test "visiting the index" do
    visit artefatos_alunos_url
    assert_selector "h1", text: "Artefato Alunos"
  end

  test "creating a Artefato aluno" do
    visit artefatos_alunos_url
    click_on "New Artefato Aluno"

    fill_in "Artefatos", with: @artefato_aluno.artefatos_id
    fill_in "Usuario Curso", with: @artefato_aluno.usuario_curso_id
    click_on "Create Artefato aluno"

    assert_text "Artefato aluno was successfully created"
    click_on "Back"
  end

  test "updating a Artefato aluno" do
    visit artefatos_alunos_url
    click_on "Edit", match: :first

    fill_in "Artefatos", with: @artefato_aluno.artefatos_id
    fill_in "Usuario Curso", with: @artefato_aluno.usuario_curso_id
    click_on "Update Artefato aluno"

    assert_text "Artefato aluno was successfully updated"
    click_on "Back"
  end

  test "destroying a Artefato aluno" do
    visit artefatos_alunos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artefato aluno was successfully destroyed"
  end
end
