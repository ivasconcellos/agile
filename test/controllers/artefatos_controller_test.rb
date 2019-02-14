require 'test_helper'

class ArtefatosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artefato = artefatos(:one)
  end

  test "should get index" do
    get artefatos_url
    assert_response :success
  end

  test "should get new" do
    get new_artefato_url
    assert_response :success
  end

  test "should create artefato" do
    assert_difference('Artefato.count') do
      post artefatos_url, params: { artefato: { ativo: @artefato.ativo, nome: @artefato.nome, tema_curso: @artefato.tema_curso } }
    end

    assert_redirected_to artefato_url(Artefato.last)
  end

  test "should show artefato" do
    get artefato_url(@artefato)
    assert_response :success
  end

  test "should get edit" do
    get edit_artefato_url(@artefato)
    assert_response :success
  end

  test "should update artefato" do
    patch artefato_url(@artefato), params: { artefato: { ativo: @artefato.ativo, nome: @artefato.nome, tema_curso: @artefato.tema_curso } }
    assert_redirected_to artefato_url(@artefato)
  end

  test "should destroy artefato" do
    assert_difference('Artefato.count', -1) do
      delete artefato_url(@artefato)
    end

    assert_redirected_to artefatos_url
  end
end
