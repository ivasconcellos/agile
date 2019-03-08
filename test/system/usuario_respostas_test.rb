require "application_system_test_case"

class UsuarioRespostaTest < ApplicationSystemTestCase
  setup do
    @usuario_resposta = usuario_respostas(:one)
  end

  test "visiting the index" do
    visit usuario_respostas_url
    assert_selector "h1", text: "Usuario Resposta"
  end

  test "creating a Usuario resposta" do
    visit usuario_respostas_url
    click_on "New Usuario Resposta"

    fill_in "Respostas Perguntas", with: @usuario_resposta.respostas_perguntas_id
    fill_in "Usuario Curso", with: @usuario_resposta.usuario_curso_id
    click_on "Create Usuario resposta"

    assert_text "Usuario resposta was successfully created"
    click_on "Back"
  end

  test "updating a Usuario resposta" do
    visit usuario_respostas_url
    click_on "Edit", match: :first

    fill_in "Respostas Perguntas", with: @usuario_resposta.respostas_perguntas_id
    fill_in "Usuario Curso", with: @usuario_resposta.usuario_curso_id
    click_on "Update Usuario resposta"

    assert_text "Usuario resposta was successfully updated"
    click_on "Back"
  end

  test "destroying a Usuario resposta" do
    visit usuario_respostas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usuario resposta was successfully destroyed"
  end
end
