require "application_system_test_case"

class AlunoRespostaTest < ApplicationSystemTestCase
  setup do
    @aluno_respostum = aluno_resposta(:one)
  end

  test "visiting the index" do
    visit aluno_resposta_url
    assert_selector "h1", text: "Aluno Resposta"
  end

  test "creating a Aluno respostum" do
    visit aluno_resposta_url
    click_on "New Aluno Respostum"

    fill_in "Aluno Curso", with: @aluno_respostum.aluno_curso_id
    fill_in "Correta", with: @aluno_respostum.correta
    fill_in "Respostas Perguntas", with: @aluno_respostum.respostas_perguntas_id
    click_on "Create Aluno respostum"

    assert_text "Aluno respostum was successfully created"
    click_on "Back"
  end

  test "updating a Aluno respostum" do
    visit aluno_resposta_url
    click_on "Edit", match: :first

    fill_in "Aluno Curso", with: @aluno_respostum.aluno_curso_id
    fill_in "Correta", with: @aluno_respostum.correta
    fill_in "Respostas Perguntas", with: @aluno_respostum.respostas_perguntas_id
    click_on "Update Aluno respostum"

    assert_text "Aluno respostum was successfully updated"
    click_on "Back"
  end

  test "destroying a Aluno respostum" do
    visit aluno_resposta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aluno respostum was successfully destroyed"
  end
end
