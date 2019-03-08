require "application_system_test_case"

class AlunoRespostaTest < ApplicationSystemTestCase
  setup do
    @aluno_resposta = aluno_respostas(:one)
  end

  test "visiting the index" do
    visit aluno_respostas_url
    assert_selector "h1", text: "Aluno Resposta"
  end

  test "creating a Aluno resposta" do
    visit aluno_respostas_url
    click_on "New Aluno Resposta"

    fill_in "Respostas Perguntas", with: @aluno_resposta.respostas_perguntas_id
    fill_in "Usuario Curso", with: @aluno_resposta.usuario_curso_id
    click_on "Create Aluno resposta"

    assert_text "Aluno resposta was successfully created"
    click_on "Back"
  end

  test "updating a Aluno resposta" do
    visit aluno_respostas_url
    click_on "Edit", match: :first

    fill_in "Respostas Perguntas", with: @aluno_resposta.respostas_perguntas_id
    fill_in "Usuario Curso", with: @aluno_resposta.usuario_curso_id
    click_on "Update Aluno resposta"

    assert_text "Aluno resposta was successfully updated"
    click_on "Back"
  end

  test "destroying a Aluno resposta" do
    visit aluno_respostas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aluno resposta was successfully destroyed"
  end
end
