require 'test_helper'

class ComunicadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comunicado = comunicados(:one)
  end

  test "should get index" do
    get comunicados_url
    assert_response :success
  end

  test "should get new" do
    get new_comunicado_url
    assert_response :success
  end

  test "should create comunicado" do
    assert_difference('Comunicado.count') do
      post comunicados_url, params: { comunicado: { assunto: @comunicado.assunto, mensagem: @comunicado.mensagem, remetente: @comunicado.remetente } }
    end

    assert_redirected_to comunicado_url(Comunicado.last)
  end

  test "should show comunicado" do
    get comunicado_url(@comunicado)
    assert_response :success
  end

  test "should get edit" do
    get edit_comunicado_url(@comunicado)
    assert_response :success
  end

  test "should update comunicado" do
    patch comunicado_url(@comunicado), params: { comunicado: { assunto: @comunicado.assunto, mensagem: @comunicado.mensagem, remetente: @comunicado.remetente } }
    assert_redirected_to comunicado_url(@comunicado)
  end

  test "should destroy comunicado" do
    assert_difference('Comunicado.count', -1) do
      delete comunicado_url(@comunicado)
    end

    assert_redirected_to comunicados_url
  end
end
