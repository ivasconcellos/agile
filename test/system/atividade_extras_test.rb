require "application_system_test_case"

class AtividadeExtrasTest < ApplicationSystemTestCase
  setup do
    @atividade_extra = atividade_extras(:one)
  end

  test "visiting the index" do
    visit atividade_extras_url
    assert_selector "h1", text: "Atividade Extras"
  end

  test "creating a Atividade extra" do
    visit atividade_extras_url
    click_on "New Atividade Extra"

    fill_in "Descricao", with: @atividade_extra.descricao
    fill_in "Modulo", with: @atividade_extra.modulo_id
    fill_in "Pontuacao", with: @atividade_extra.pontuacao
    fill_in "Usuario curso", with: @atividade_extra.usuario_curso_id
    click_on "Create Atividade extra"

    assert_text "Atividade extra was successfully created"
    click_on "Back"
  end

  test "updating a Atividade extra" do
    visit atividade_extras_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @atividade_extra.descricao
    fill_in "Modulo", with: @atividade_extra.modulo_id
    fill_in "Pontuacao", with: @atividade_extra.pontuacao
    fill_in "Usuario curso", with: @atividade_extra.usuario_curso_id
    click_on "Update Atividade extra"

    assert_text "Atividade extra was successfully updated"
    click_on "Back"
  end

  test "destroying a Atividade extra" do
    visit atividade_extras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Atividade extra was successfully destroyed"
  end
end
