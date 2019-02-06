require "application_system_test_case"

class QuizesTest < ApplicationSystemTestCase
  setup do
    @quiz = quizes(:one)
  end

  test "visiting the index" do
    visit quizes_url
    assert_selector "h1", text: "Quizes"
  end

  test "creating a Quiz" do
    visit quizes_url
    click_on "New Quiz"

    fill_in "Curso", with: @quiz.curso_id
    fill_in "Data Inicio", with: @quiz.data_inicio
    fill_in "Data Termino", with: @quiz.data_termino
    fill_in "Descricao", with: @quiz.descricao
    fill_in "Max Tentativas", with: @quiz.max_tentativas
    fill_in "Nome", with: @quiz.nome
    fill_in "Usuario Curso", with: @quiz.usuario_curso_id
    click_on "Create Quiz"

    assert_text "Quiz was successfully created"
    click_on "Back"
  end

  test "updating a Quiz" do
    visit quizes_url
    click_on "Edit", match: :first

    fill_in "Curso", with: @quiz.curso_id
    fill_in "Data Inicio", with: @quiz.data_inicio
    fill_in "Data Termino", with: @quiz.data_termino
    fill_in "Descricao", with: @quiz.descricao
    fill_in "Max Tentativas", with: @quiz.max_tentativas
    fill_in "Nome", with: @quiz.nome
    fill_in "Usuario Curso", with: @quiz.usuario_curso_id
    click_on "Update Quiz"

    assert_text "Quiz was successfully updated"
    click_on "Back"
  end

  test "destroying a Quiz" do
    visit quizes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quiz was successfully destroyed"
  end
end
