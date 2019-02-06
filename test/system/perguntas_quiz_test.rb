require "application_system_test_case"

class PerguntaQuizesTest < ApplicationSystemTestCase
  setup do
    @pergunta_quiz = perguntas_quiz(:one)
  end

  test "visiting the index" do
    visit perguntas_quiz_url
    assert_selector "h1", text: "Pergunta Quizes"
  end

  test "creating a Pergunta quiz" do
    visit perguntas_quiz_url
    click_on "New Pergunta Quiz"

    fill_in "Descricao", with: @pergunta_quiz.descricao
    fill_in "Quiz", with: @pergunta_quiz.quiz_id
    click_on "Create Pergunta quiz"

    assert_text "Pergunta quiz was successfully created"
    click_on "Back"
  end

  test "updating a Pergunta quiz" do
    visit perguntas_quiz_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @pergunta_quiz.descricao
    fill_in "Quiz", with: @pergunta_quiz.quiz_id
    click_on "Update Pergunta quiz"

    assert_text "Pergunta quiz was successfully updated"
    click_on "Back"
  end

  test "destroying a Pergunta quiz" do
    visit perguntas_quiz_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pergunta quiz was successfully destroyed"
  end
end
