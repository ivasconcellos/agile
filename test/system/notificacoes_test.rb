require "application_system_test_case"

class NotificacoesTest < ApplicationSystemTestCase
  setup do
    @notificacao = notificacoes(:one)
  end

  test "visiting the index" do
    visit notificacoes_url
    assert_selector "h1", text: "Notificacoes"
  end

  test "creating a Notificacao" do
    visit notificacoes_url
    click_on "New Notificacao"

    fill_in "Texto", with: @notificacao.texto
    fill_in "Tipo", with: @notificacao.tipo
    fill_in "Usuario curso", with: @notificacao.usuario_curso_id
    click_on "Create Notificacao"

    assert_text "Notificacao was successfully created"
    click_on "Back"
  end

  test "updating a Notificacao" do
    visit notificacoes_url
    click_on "Edit", match: :first

    fill_in "Texto", with: @notificacao.texto
    fill_in "Tipo", with: @notificacao.tipo
    fill_in "Usuario curso", with: @notificacao.usuario_curso_id
    click_on "Update Notificacao"

    assert_text "Notificacao was successfully updated"
    click_on "Back"
  end

  test "destroying a Notificacao" do
    visit notificacoes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notificacao was successfully destroyed"
  end
end
