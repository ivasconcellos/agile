require "application_system_test_case"

class UsuarioCursosTest < ApplicationSystemTestCase
  setup do
    @usuario_curso = usuario_curso(:one)
  end

  test "visiting the index" do
    visit usuario_curso_url
    assert_selector "h1", text: "Usuario Cursos"
  end

  test "creating a Usuario curso" do
    visit usuario_curso_url
    click_on "New Usuario Curso"

    fill_in "Curso", with: @usuario_curso.curso
    fill_in "Nickname", with: @usuario_curso.nickname
    fill_in "Pefil", with: @usuario_curso.pefil
    fill_in "Usuario", with: @usuario_curso.usuario
    click_on "Create Usuario curso"

    assert_text "Usuario curso was successfully created"
    click_on "Back"
  end

  test "updating a Usuario curso" do
    visit usuario_curso_url
    click_on "Edit", match: :first

    fill_in "Curso", with: @usuario_curso.curso
    fill_in "Nickname", with: @usuario_curso.nickname
    fill_in "Pefil", with: @usuario_curso.pefil
    fill_in "Usuario", with: @usuario_curso.usuario
    click_on "Update Usuario curso"

    assert_text "Usuario curso was successfully updated"
    click_on "Back"
  end

  test "destroying a Usuario curso" do
    visit usuario_curso_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usuario curso was successfully destroyed"
  end
end
