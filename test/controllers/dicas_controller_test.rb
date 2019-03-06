require 'test_helper'

class DicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dica = dicas(:one)
  end

  test "should get index" do
    get dicas_url
    assert_response :success
  end

  test "should get new" do
    get new_dica_url
    assert_response :success
  end

  test "should create dica" do
    assert_difference('Dica.count') do
      post dicas_url, params: { dica: { ativo: @dica.ativo, descricao: @dica.descricao, missao_id: @dica.missao_id, nome: @dica.nome } }
    end

    assert_redirected_to dica_url(Dica.last)
  end

  test "should show dica" do
    get dica_url(@dica)
    assert_response :success
  end

  test "should get edit" do
    get edit_dica_url(@dica)
    assert_response :success
  end

  test "should update dica" do
    patch dica_url(@dica), params: { dica: { ativo: @dica.ativo, descricao: @dica.descricao, missao_id: @dica.missao_id, nome: @dica.nome } }
    assert_redirected_to dica_url(@dica)
  end

  test "should destroy dica" do
    assert_difference('Dica.count', -1) do
      delete dica_url(@dica)
    end

    assert_redirected_to dicas_url
  end
end
