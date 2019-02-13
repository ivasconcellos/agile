require 'test_helper'

class AlunoRespostaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aluno_respostum = aluno_resposta(:one)
  end

  test "should get index" do
    get aluno_resposta_url
    assert_response :success
  end

  test "should get new" do
    get new_aluno_respostum_url
    assert_response :success
  end

  test "should create aluno_respostum" do
    assert_difference('AlunoRespostum.count') do
      post aluno_resposta_url, params: { aluno_respostum: { aluno_curso_id: @aluno_respostum.aluno_curso_id, correta: @aluno_respostum.correta, respostas_perguntas_id: @aluno_respostum.respostas_perguntas_id } }
    end

    assert_redirected_to aluno_respostum_url(AlunoRespostum.last)
  end

  test "should show aluno_respostum" do
    get aluno_respostum_url(@aluno_respostum)
    assert_response :success
  end

  test "should get edit" do
    get edit_aluno_respostum_url(@aluno_respostum)
    assert_response :success
  end

  test "should update aluno_respostum" do
    patch aluno_respostum_url(@aluno_respostum), params: { aluno_respostum: { aluno_curso_id: @aluno_respostum.aluno_curso_id, correta: @aluno_respostum.correta, respostas_perguntas_id: @aluno_respostum.respostas_perguntas_id } }
    assert_redirected_to aluno_respostum_url(@aluno_respostum)
  end

  test "should destroy aluno_respostum" do
    assert_difference('AlunoRespostum.count', -1) do
      delete aluno_respostum_url(@aluno_respostum)
    end

    assert_redirected_to aluno_resposta_url
  end
end
