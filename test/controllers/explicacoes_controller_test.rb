require 'test_helper'

class ExplicacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @explicacao = explicacoes(:one)
  end

  test "should get index" do
    get explicacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_explicacao_url
    assert_response :success
  end

  test "should create explicacao" do
    assert_difference('Explicacao.count') do
      post explicacoes_url, params: { explicacao: { audio: @explicacao.audio, conteudo_id: @explicacao.conteudo_id, descricao: @explicacao.descricao, nome: @explicacao.nome } }
    end

    assert_redirected_to explicacao_url(Explicacao.last)
  end

  test "should show explicacao" do
    get explicacao_url(@explicacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_explicacao_url(@explicacao)
    assert_response :success
  end

  test "should update explicacao" do
    patch explicacao_url(@explicacao), params: { explicacao: { audio: @explicacao.audio, conteudo_id: @explicacao.conteudo_id, descricao: @explicacao.descricao, nome: @explicacao.nome } }
    assert_redirected_to explicacao_url(@explicacao)
  end

  test "should destroy explicacao" do
    assert_difference('Explicacao.count', -1) do
      delete explicacao_url(@explicacao)
    end

    assert_redirected_to explicacoes_url
  end
end
