require 'test_helper'

class PerguntasQuizControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pergunta_quiz = perguntas_quiz(:one)
  end

  test "should get index" do
    get perguntas_quiz_url
    assert_response :success
  end

  test "should get new" do
    get new_pergunta_quiz_url
    assert_response :success
  end

  test "should create pergunta_quiz" do
    assert_difference('PerguntaQuiz.count') do
      post perguntas_quiz_url, params: { pergunta_quiz: { descricao: @pergunta_quiz.descricao, quiz_id: @pergunta_quiz.quiz_id } }
    end

    assert_redirected_to pergunta_quiz_url(PerguntaQuiz.last)
  end

  test "should show pergunta_quiz" do
    get pergunta_quiz_url(@pergunta_quiz)
    assert_response :success
  end

  test "should get edit" do
    get edit_pergunta_quiz_url(@pergunta_quiz)
    assert_response :success
  end

  test "should update pergunta_quiz" do
    patch pergunta_quiz_url(@pergunta_quiz), params: { pergunta_quiz: { descricao: @pergunta_quiz.descricao, quiz_id: @pergunta_quiz.quiz_id } }
    assert_redirected_to pergunta_quiz_url(@pergunta_quiz)
  end

  test "should destroy pergunta_quiz" do
    assert_difference('PerguntaQuiz.count', -1) do
      delete pergunta_quiz_url(@pergunta_quiz)
    end

    assert_redirected_to perguntas_quiz_url
  end
end
