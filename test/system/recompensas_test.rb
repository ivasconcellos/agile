require "application_system_test_case"

class RecompensasTest < ApplicationSystemTestCase
  setup do
    @recompensa = recompensas(:one)
  end

  test "visiting the index" do
    visit recompensas_url
    assert_selector "h1", text: "Recompensas"
  end

  test "creating a Recompensa" do
    visit recompensas_url
    click_on "New Recompensa"

    fill_in "Curso", with: @recompensa.curso_id
    fill_in "Descricao", with: @recompensa.descricao
    fill_in "Nome", with: @recompensa.nome
    fill_in "Posicao ranking", with: @recompensa.posicao_ranking
    fill_in "Usuario curso", with: @recompensa.usuario_curso_id
    click_on "Create Recompensa"

    assert_text "Recompensa was successfully created"
    click_on "Back"
  end

  test "updating a Recompensa" do
    visit recompensas_url
    click_on "Edit", match: :first

    fill_in "Curso", with: @recompensa.curso_id
    fill_in "Descricao", with: @recompensa.descricao
    fill_in "Nome", with: @recompensa.nome
    fill_in "Posicao ranking", with: @recompensa.posicao_ranking
    fill_in "Usuario curso", with: @recompensa.usuario_curso_id
    click_on "Update Recompensa"

    assert_text "Recompensa was successfully updated"
    click_on "Back"
  end

  test "destroying a Recompensa" do
    visit recompensas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recompensa was successfully destroyed"
  end
end
