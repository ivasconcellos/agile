require "application_system_test_case"

class PontuacaoRemovidasTest < ApplicationSystemTestCase
  setup do
    @pontuacao_removida = pontuacao_removidas(:one)
  end

  test "visiting the index" do
    visit pontuacao_removidas_url
    assert_selector "h1", text: "Pontuacao Removidas"
  end

  test "creating a Pontuacao removida" do
    visit pontuacao_removidas_url
    click_on "New Pontuacao Removida"

    fill_in "Aluno", with: @pontuacao_removida.aluno_id
    fill_in "Justificativa", with: @pontuacao_removida.justificativa
    fill_in "Pontuacao", with: @pontuacao_removida.pontuacao
    fill_in "Professor", with: @pontuacao_removida.professor_id
    click_on "Create Pontuacao removida"

    assert_text "Pontuacao removida was successfully created"
    click_on "Back"
  end

  test "updating a Pontuacao removida" do
    visit pontuacao_removidas_url
    click_on "Edit", match: :first

    fill_in "Aluno", with: @pontuacao_removida.aluno_id
    fill_in "Justificativa", with: @pontuacao_removida.justificativa
    fill_in "Pontuacao", with: @pontuacao_removida.pontuacao
    fill_in "Professor", with: @pontuacao_removida.professor_id
    click_on "Update Pontuacao removida"

    assert_text "Pontuacao removida was successfully updated"
    click_on "Back"
  end

  test "destroying a Pontuacao removida" do
    visit pontuacao_removidas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pontuacao removida was successfully destroyed"
  end
end
