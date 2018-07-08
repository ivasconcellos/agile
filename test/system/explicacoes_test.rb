require "application_system_test_case"

class ExplicacoesTest < ApplicationSystemTestCase
  setup do
    @explicacao = explicacoes(:one)
  end

  test "visiting the index" do
    visit explicacoes_url
    assert_selector "h1", text: "Explicacoes"
  end

  test "creating a Explicacao" do
    visit explicacoes_url
    click_on "New Explicacao"

    fill_in "Audio", with: @explicacao.audio
    fill_in "Conteudo", with: @explicacao.conteudo_id
    fill_in "Descricao", with: @explicacao.descricao
    fill_in "Nome", with: @explicacao.nome
    click_on "Create Explicacao"

    assert_text "Explicacao was successfully created"
    click_on "Back"
  end

  test "updating a Explicacao" do
    visit explicacoes_url
    click_on "Edit", match: :first

    fill_in "Audio", with: @explicacao.audio
    fill_in "Conteudo", with: @explicacao.conteudo_id
    fill_in "Descricao", with: @explicacao.descricao
    fill_in "Nome", with: @explicacao.nome
    click_on "Update Explicacao"

    assert_text "Explicacao was successfully updated"
    click_on "Back"
  end

  test "destroying a Explicacao" do
    visit explicacoes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Explicacao was successfully destroyed"
  end
end
