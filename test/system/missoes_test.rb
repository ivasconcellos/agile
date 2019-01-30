require "application_system_test_case"

class MissoesTest < ApplicationSystemTestCase
  setup do
    @missao = missoes(:one)
  end

  test "visiting the index" do
    visit missoes_url
    assert_selector "h1", text: "Missoes"
  end

  test "creating a Missao" do
    visit missoes_url
    click_on "New Missao"

    fill_in "Curso", with: @missao.curso_id
    fill_in "Descricao", with: @missao.descricao
    fill_in "Nome", with: @missao.nome
    fill_in "Usuario Curso", with: @missao.usuario_curso_id
    click_on "Create Missao"

    assert_text "Missao was successfully created"
    click_on "Back"
  end

  test "updating a Missao" do
    visit missoes_url
    click_on "Edit", match: :first

    fill_in "Curso", with: @missao.curso_id
    fill_in "Descricao", with: @missao.descricao
    fill_in "Nome", with: @missao.nome
    fill_in "Usuario Curso", with: @missao.usuario_curso_id
    click_on "Update Missao"

    assert_text "Missao was successfully updated"
    click_on "Back"
  end

  test "destroying a Missao" do
    visit missoes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Missao was successfully destroyed"
  end
end
