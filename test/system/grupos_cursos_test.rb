require "application_system_test_case"

class GrupoCursosTest < ApplicationSystemTestCase
  setup do
    @grupo_curso = grupos_cursos(:one)
  end

  test "visiting the index" do
    visit grupos_cursos_url
    assert_selector "h1", text: "Grupo Cursos"
  end

  test "creating a Grupo curso" do
    visit grupos_cursos_url
    click_on "New Grupo Curso"

    fill_in "Curso", with: @grupo_curso.curso_id
    fill_in "Grupo", with: @grupo_curso.grupo_id
    fill_in "Nome Curso", with: @grupo_curso.nome_curso
    click_on "Create Grupo curso"

    assert_text "Grupo curso was successfully created"
    click_on "Back"
  end

  test "updating a Grupo curso" do
    visit grupos_cursos_url
    click_on "Edit", match: :first

    fill_in "Curso", with: @grupo_curso.curso_id
    fill_in "Grupo", with: @grupo_curso.grupo_id
    fill_in "Nome Curso", with: @grupo_curso.nome_curso
    click_on "Update Grupo curso"

    assert_text "Grupo curso was successfully updated"
    click_on "Back"
  end

  test "destroying a Grupo curso" do
    visit grupos_cursos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grupo curso was successfully destroyed"
  end
end
