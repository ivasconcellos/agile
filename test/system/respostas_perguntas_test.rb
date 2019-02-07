require "application_system_test_case"

class RespostaPerguntaTest < ApplicationSystemTestCase
  setup do
    @resposta_pergunta = respostas_perguntas(:one)
  end

  test "visiting the index" do
    visit respostas_perguntas_url
    assert_selector "h1", text: "Resposta Pergunta"
  end

  test "creating a Resposta pergunta" do
    visit respostas_perguntas_url
    click_on "New Resposta Pergunta"

    fill_in "Comentario", with: @resposta_pergunta.comentario
    fill_in "Correta", with: @resposta_pergunta.correta
    fill_in "Descricao", with: @resposta_pergunta.descricao
    fill_in "Pergunta", with: @resposta_pergunta.pergunta_id
    click_on "Create Resposta pergunta"

    assert_text "Resposta pergunta was successfully created"
    click_on "Back"
  end

  test "updating a Resposta pergunta" do
    visit respostas_perguntas_url
    click_on "Edit", match: :first

    fill_in "Comentario", with: @resposta_pergunta.comentario
    fill_in "Correta", with: @resposta_pergunta.correta
    fill_in "Descricao", with: @resposta_pergunta.descricao
    fill_in "Pergunta", with: @resposta_pergunta.pergunta_id
    click_on "Update Resposta pergunta"

    assert_text "Resposta pergunta was successfully updated"
    click_on "Back"
  end

  test "destroying a Resposta pergunta" do
    visit respostas_perguntas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Resposta pergunta was successfully destroyed"
  end
end
