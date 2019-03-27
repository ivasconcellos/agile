require 'test_helper'

class DialogosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dialogo = dialogos(:one)
  end

  test "should get index" do
    get dialogos_url
    assert_response :success
  end

  test "should get new" do
    get new_dialogo_url
    assert_response :success
  end

  test "should create dialogo" do
    assert_difference('Dialogo.count') do
      post dialogos_url, params: { dialogo: { modulo_id: @dialogo.modulo_id, texto: @dialogo.texto, titulo: @dialogo.titulo, usuario_curso_id: @dialogo.usuario_curso_id } }
    end

    assert_redirected_to dialogo_url(Dialogo.last)
  end

  test "should show dialogo" do
    get dialogo_url(@dialogo)
    assert_response :success
  end

  test "should get edit" do
    get edit_dialogo_url(@dialogo)
    assert_response :success
  end

  test "should update dialogo" do
    patch dialogo_url(@dialogo), params: { dialogo: { modulo_id: @dialogo.modulo_id, texto: @dialogo.texto, titulo: @dialogo.titulo, usuario_curso_id: @dialogo.usuario_curso_id } }
    assert_redirected_to dialogo_url(@dialogo)
  end

  test "should destroy dialogo" do
    assert_difference('Dialogo.count', -1) do
      delete dialogo_url(@dialogo)
    end

    assert_redirected_to dialogos_url
  end
end
