require "application_system_test_case"

class AvataresTest < ApplicationSystemTestCase
  setup do
    @avatar = avatares(:one)
  end

  test "visiting the index" do
    visit avatares_url
    assert_selector "h1", text: "Avatares"
  end

  test "creating a Avatar" do
    visit avatares_url
    click_on "New Avatar"

    fill_in "Nome", with: @avatar.nome
    fill_in "Perfil", with: @avatar.perfil
    fill_in "Tema Curso", with: @avatar.tema_curso_id
    click_on "Create Avatar"

    assert_text "Avatar was successfully created"
    click_on "Back"
  end

  test "updating a Avatar" do
    visit avatares_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @avatar.nome
    fill_in "Perfil", with: @avatar.perfil
    fill_in "Tema Curso", with: @avatar.tema_curso_id
    click_on "Update Avatar"

    assert_text "Avatar was successfully updated"
    click_on "Back"
  end

  test "destroying a Avatar" do
    visit avatares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Avatar was successfully destroyed"
  end
end
