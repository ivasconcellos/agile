require "application_system_test_case"

class NiveisTest < ApplicationSystemTestCase
  setup do
    @nivel = niveis(:one)
  end

  test "visiting the index" do
    visit niveis_url
    assert_selector "h1", text: "Niveis"
  end

  test "creating a Nivel" do
    visit niveis_url
    click_on "New Nivel"

    fill_in "Nome", with: @nivel.nome
    fill_in "Pontos Requeridos", with: @nivel.pontos_requeridos
    click_on "Create Nivel"

    assert_text "Nivel was successfully created"
    click_on "Back"
  end

  test "updating a Nivel" do
    visit niveis_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @nivel.nome
    fill_in "Pontos Requeridos", with: @nivel.pontos_requeridos
    click_on "Update Nivel"

    assert_text "Nivel was successfully updated"
    click_on "Back"
  end

  test "destroying a Nivel" do
    visit niveis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nivel was successfully destroyed"
  end
end
