require 'test_helper'

class QuizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz = quizes(:one)
  end

  test "should get index" do
    get quizes_url
    assert_response :success
  end

  test "should get new" do
    get new_quiz_url
    assert_response :success
  end

  test "should create quiz" do
    assert_difference('Quiz.count') do
      post quizes_url, params: { quiz: { curso_id: @quiz.curso_id, data_inicio: @quiz.data_inicio, data_termino: @quiz.data_termino, descricao: @quiz.descricao, max_tentativas: @quiz.max_tentativas, nome: @quiz.nome, usuario_curso_id: @quiz.usuario_curso_id } }
    end

    assert_redirected_to quiz_url(Quiz.last)
  end

  test "should show quiz" do
    get quiz_url(@quiz)
    assert_response :success
  end

  test "should get edit" do
    get edit_quiz_url(@quiz)
    assert_response :success
  end

  test "should update quiz" do
    patch quiz_url(@quiz), params: { quiz: { curso_id: @quiz.curso_id, data_inicio: @quiz.data_inicio, data_termino: @quiz.data_termino, descricao: @quiz.descricao, max_tentativas: @quiz.max_tentativas, nome: @quiz.nome, usuario_curso_id: @quiz.usuario_curso_id } }
    assert_redirected_to quiz_url(@quiz)
  end

  test "should destroy quiz" do
    assert_difference('Quiz.count', -1) do
      delete quiz_url(@quiz)
    end

    assert_redirected_to quizes_url
  end
end
