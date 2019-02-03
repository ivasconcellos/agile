require 'test_helper'

class NiveisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nivel = niveis(:one)
  end

  test "should get index" do
    get niveis_url
    assert_response :success
  end

  test "should get new" do
    get new_nivel_url
    assert_response :success
  end

  test "should create nivel" do
    assert_difference('Nivel.count') do
      post niveis_url, params: { nivel: { nome: @nivel.nome, pontos_requeridos: @nivel.pontos_requeridos } }
    end

    assert_redirected_to nivel_url(Nivel.last)
  end

  test "should show nivel" do
    get nivel_url(@nivel)
    assert_response :success
  end

  test "should get edit" do
    get edit_nivel_url(@nivel)
    assert_response :success
  end

  test "should update nivel" do
    patch nivel_url(@nivel), params: { nivel: { nome: @nivel.nome, pontos_requeridos: @nivel.pontos_requeridos } }
    assert_redirected_to nivel_url(@nivel)
  end

  test "should destroy nivel" do
    assert_difference('Nivel.count', -1) do
      delete nivel_url(@nivel)
    end

    assert_redirected_to niveis_url
  end
end
