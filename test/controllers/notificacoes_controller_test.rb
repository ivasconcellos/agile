require 'test_helper'

class NotificacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notificacao = notificacoes(:one)
  end

  test "should get index" do
    get notificacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_notificacao_url
    assert_response :success
  end

  test "should create notificacao" do
    assert_difference('Notificacao.count') do
      post notificacoes_url, params: { notificacao: { texto: @notificacao.texto, tipo: @notificacao.tipo, usuario_curso_id: @notificacao.usuario_curso_id } }
    end

    assert_redirected_to notificacao_url(Notificacao.last)
  end

  test "should show notificacao" do
    get notificacao_url(@notificacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_notificacao_url(@notificacao)
    assert_response :success
  end

  test "should update notificacao" do
    patch notificacao_url(@notificacao), params: { notificacao: { texto: @notificacao.texto, tipo: @notificacao.tipo, usuario_curso_id: @notificacao.usuario_curso_id } }
    assert_redirected_to notificacao_url(@notificacao)
  end

  test "should destroy notificacao" do
    assert_difference('Notificacao.count', -1) do
      delete notificacao_url(@notificacao)
    end

    assert_redirected_to notificacoes_url
  end
end
