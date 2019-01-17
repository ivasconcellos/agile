require "application_system_test_case"

class modulosTest < ApplicationSystemTestCase
  setup do
    @modulo = modulos(:one)
  end

  test "visiting the index" do
    visit modulos_url
    assert_selector "h1", text: "modulos"
  end

  test "creating a modulo" do
    visit modulos_url
    click_on "New modulo"

    fill_in "Curso", with: @modulo.curso_id
    fill_in "Descricao", with: @modulo.descricao
    fill_in "Nome", with: @modulo.nome
    click_on "Create modulo"

    assert_text "modulo was successfully created"
    click_on "Back"
  end

  test "updating a modulo" do
    visit modulos_url
    click_on "Edit", match: :first

    fill_in "Curso", with: @modulo.curso_id
    fill_in "Descricao", with: @modulo.descricao
    fill_in "Nome", with: @modulo.nome
    click_on "Update modulo"

    assert_text "modulo was successfully updated"
    click_on "Back"
  end

  test "destroying a modulo" do
    visit modulos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "modulo was successfully destroyed"
  end
end
