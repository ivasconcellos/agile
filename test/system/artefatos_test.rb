require "application_system_test_case"

class ArtefatosTest < ApplicationSystemTestCase
  setup do
    @artefato = artefatos(:one)
  end

  test "visiting the index" do
    visit artefatos_url
    assert_selector "h1", text: "Artefatos"
  end

  test "creating a Artefato" do
    visit artefatos_url
    click_on "New Artefato"

    fill_in "Ativo", with: @artefato.ativo
    fill_in "Nome", with: @artefato.nome
    fill_in "Tema Curso", with: @artefato.tema_curso
    click_on "Create Artefato"

    assert_text "Artefato was successfully created"
    click_on "Back"
  end

  test "updating a Artefato" do
    visit artefatos_url
    click_on "Edit", match: :first

    fill_in "Ativo", with: @artefato.ativo
    fill_in "Nome", with: @artefato.nome
    fill_in "Tema Curso", with: @artefato.tema_curso
    click_on "Update Artefato"

    assert_text "Artefato was successfully updated"
    click_on "Back"
  end

  test "destroying a Artefato" do
    visit artefatos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artefato was successfully destroyed"
  end
end
