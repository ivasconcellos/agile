require "application_system_test_case"

class CursosTest < ApplicationSystemTestCase
  setup do
    @curso = cursos(:one)
  end

  test "visiting the index" do
    visit cursos_url
    assert_selector "h1", text: "Cursos"
  end

  test "creating a Curso" do
    visit cursos_url
    click_on "New Curso"

    fill_in "Ativo", with: @curso.ativo
    fill_in "Data Inicio", with: @curso.data_inicio
    fill_in "Data Termino", with: @curso.data_termino
    fill_in "Descricao", with: @curso.descricao
    fill_in "Nome", with: @curso.nome
    fill_in "Tema", with: @curso.tema
    click_on "Create Curso"

    assert_text "Curso was successfully created"
    click_on "Back"
  end

  test "updating a Curso" do
    visit cursos_url
    click_on "Edit", match: :first

    fill_in "Ativo", with: @curso.ativo
    fill_in "Data Inicio", with: @curso.data_inicio
    fill_in "Data Termino", with: @curso.data_termino
    fill_in "Descricao", with: @curso.descricao
    fill_in "Nome", with: @curso.nome
    fill_in "Tema", with: @curso.tema
    click_on "Update Curso"

    assert_text "Curso was successfully updated"
    click_on "Back"
  end

  test "destroying a Curso" do
    visit cursos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Curso was successfully destroyed"
  end
end
