require 'test_helper'

class CursoCertificadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curso_certificado = curso_certificados(:one)
  end

  test "should get index" do
    get curso_certificados_url
    assert_response :success
  end

  test "should get new" do
    get new_curso_certificado_url
    assert_response :success
  end

  test "should create curso_certificado" do
    assert_difference('CursoCertificado.count') do
      post curso_certificados_url, params: { curso_certificado: { curso_id: @curso_certificado.curso_id, data_finalizacao: @curso_certificado.data_finalizacao, hash_validacao: @curso_certificado.hash_validacao, usuario_id: @curso_certificado.usuario_id } }
    end

    assert_redirected_to curso_certificado_url(CursoCertificado.last)
  end

  test "should show curso_certificado" do
    get curso_certificado_url(@curso_certificado)
    assert_response :success
  end

  test "should get edit" do
    get edit_curso_certificado_url(@curso_certificado)
    assert_response :success
  end

  test "should update curso_certificado" do
    patch curso_certificado_url(@curso_certificado), params: { curso_certificado: { curso_id: @curso_certificado.curso_id, data_finalizacao: @curso_certificado.data_finalizacao, hash_validacao: @curso_certificado.hash_validacao, usuario_id: @curso_certificado.usuario_id } }
    assert_redirected_to curso_certificado_url(@curso_certificado)
  end

  test "should destroy curso_certificado" do
    assert_difference('CursoCertificado.count', -1) do
      delete curso_certificado_url(@curso_certificado)
    end

    assert_redirected_to curso_certificados_url
  end
end
