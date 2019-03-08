require 'test_helper'

class UsuarioRespostasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usuario_resposta = usuario_respostas(:one)
  end

  test "should get index" do
    get usuario_respostas_url
    assert_response :success
  end

  test "should get new" do
    get new_usuario_resposta_url
    assert_response :success
  end

  test "should create usuario_resposta" do
    assert_difference('UsuarioResposta.count') do
      post usuario_respostas_url, params: { usuario_resposta: { respostas_perguntas_id: @usuario_resposta.respostas_perguntas_id, usuario_curso_id: @usuario_resposta.usuario_curso_id } }
    end

    assert_redirected_to usuario_resposta_url(UsuarioResposta.last)
  end

  test "should show usuario_resposta" do
    get usuario_resposta_url(@usuario_resposta)
    assert_response :success
  end

  test "should get edit" do
    get edit_usuario_resposta_url(@usuario_resposta)
    assert_response :success
  end

  test "should update usuario_resposta" do
    patch usuario_resposta_url(@usuario_resposta), params: { usuario_resposta: { respostas_perguntas_id: @usuario_resposta.respostas_perguntas_id, usuario_curso_id: @usuario_resposta.usuario_curso_id } }
    assert_redirected_to usuario_resposta_url(@usuario_resposta)
  end

  test "should destroy usuario_resposta" do
    assert_difference('UsuarioResposta.count', -1) do
      delete usuario_resposta_url(@usuario_resposta)
    end

    assert_redirected_to usuario_respostas_url
  end
end
