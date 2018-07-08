require 'test_helper'

class ConteudosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conteudo = conteudos(:one)
  end

  test "should get index" do
    get conteudos_url
    assert_response :success
  end

  test "should get new" do
    get new_conteudo_url
    assert_response :success
  end

  test "should create conteudo" do
    assert_difference('Conteudo.count') do
      post conteudos_url, params: { conteudo: { curso_id: @conteudo.curso_id, descricao: @conteudo.descricao, nome: @conteudo.nome } }
    end

    assert_redirected_to conteudo_url(Conteudo.last)
  end

  test "should show conteudo" do
    get conteudo_url(@conteudo)
    assert_response :success
  end

  test "should get edit" do
    get edit_conteudo_url(@conteudo)
    assert_response :success
  end

  test "should update conteudo" do
    patch conteudo_url(@conteudo), params: { conteudo: { curso_id: @conteudo.curso_id, descricao: @conteudo.descricao, nome: @conteudo.nome } }
    assert_redirected_to conteudo_url(@conteudo)
  end

  test "should destroy conteudo" do
    assert_difference('Conteudo.count', -1) do
      delete conteudo_url(@conteudo)
    end

    assert_redirected_to conteudos_url
  end
end
