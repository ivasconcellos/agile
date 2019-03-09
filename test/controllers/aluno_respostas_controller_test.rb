require 'test_helper'

class AlunoRespostasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aluno_resposta = aluno_respostas(:one)
  end

  test "should get index" do
    get aluno_respostas_url
    assert_response :success
  end

  test "should get new" do
    get new_aluno_resposta_url
    assert_response :success
  end

  test "should create aluno_resposta" do
    assert_difference('AlunoResposta.count') do
      post aluno_respostas_url, params: { aluno_resposta: { respostas_perguntas_id: @aluno_resposta.respostas_perguntas_id, usuario_curso_id: @aluno_resposta.usuario_curso_id } }
    end

    assert_redirected_to aluno_resposta_url(AlunoResposta.last)
  end

  test "should show aluno_resposta" do
    get aluno_resposta_url(@aluno_resposta)
    assert_response :success
  end

  test "should get edit" do
    get edit_aluno_resposta_url(@aluno_resposta)
    assert_response :success
  end

  test "should update aluno_resposta" do
    patch aluno_resposta_url(@aluno_resposta), params: { aluno_resposta: { respostas_perguntas_id: @aluno_resposta.respostas_perguntas_id, usuario_curso_id: @aluno_resposta.usuario_curso_id } }
    assert_redirected_to aluno_resposta_url(@aluno_resposta)
  end

  test "should destroy aluno_resposta" do
    assert_difference('AlunoResposta.count', -1) do
      delete aluno_resposta_url(@aluno_resposta)
    end

    assert_redirected_to aluno_respostas_url
  end
end
