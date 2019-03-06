require "application_system_test_case"

class DicasTest < ApplicationSystemTestCase
  setup do
    @dica = dicas(:one)
  end

  test "visiting the index" do
    visit dicas_url
    assert_selector "h1", text: "Dicas"
  end

  test "creating a Dica" do
    visit dicas_url
    click_on "New Dica"

    fill_in "Ativo", with: @dica.ativo
    fill_in "Descricao", with: @dica.descricao
    fill_in "Missao", with: @dica.missao_id
    fill_in "Nome", with: @dica.nome
    click_on "Create Dica"

    assert_text "Dica was successfully created"
    click_on "Back"
  end

  test "updating a Dica" do
    visit dicas_url
    click_on "Edit", match: :first

    fill_in "Ativo", with: @dica.ativo
    fill_in "Descricao", with: @dica.descricao
    fill_in "Missao", with: @dica.missao_id
    fill_in "Nome", with: @dica.nome
    click_on "Update Dica"

    assert_text "Dica was successfully updated"
    click_on "Back"
  end

  test "destroying a Dica" do
    visit dicas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dica was successfully destroyed"
  end
end
