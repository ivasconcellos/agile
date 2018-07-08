require "application_system_test_case"

class TemaCursosTest < ApplicationSystemTestCase
  setup do
    @tema_curso = temas_cursos(:one)
  end

  test "visiting the index" do
    visit temas_cursos_url
    assert_selector "h1", text: "Tema Cursos"
  end

  test "creating a Tema curso" do
    visit temas_cursos_url
    click_on "New Tema Curso"

    fill_in "Ativo", with: @tema_curso.ativo
    fill_in "Cor Texto", with: @tema_curso.cor_texto
    fill_in "Cor Titulo", with: @tema_curso.cor_titulo
    fill_in "Nome", with: @tema_curso.nome
    click_on "Create Tema curso"

    assert_text "Tema curso was successfully created"
    click_on "Back"
  end

  test "updating a Tema curso" do
    visit temas_cursos_url
    click_on "Edit", match: :first

    fill_in "Ativo", with: @tema_curso.ativo
    fill_in "Cor Texto", with: @tema_curso.cor_texto
    fill_in "Cor Titulo", with: @tema_curso.cor_titulo
    fill_in "Nome", with: @tema_curso.nome
    click_on "Update Tema curso"

    assert_text "Tema curso was successfully updated"
    click_on "Back"
  end

  test "destroying a Tema curso" do
    visit temas_cursos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tema curso was successfully destroyed"
  end
end
