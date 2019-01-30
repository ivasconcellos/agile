require 'test_helper'

class MissoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @missao = missoes(:one)
  end

  test "should get index" do
    get missoes_url
    assert_response :success
  end

  test "should get new" do
    get new_missao_url
    assert_response :success
  end

  test "should create missao" do
    assert_difference('Missao.count') do
      post missoes_url, params: { missao: { curso_id: @missao.curso_id, descricao: @missao.descricao, nome: @missao.nome, usuario_curso_id: @missao.usuario_curso_id } }
    end

    assert_redirected_to missao_url(Missao.last)
  end

  test "should show missao" do
    get missao_url(@missao)
    assert_response :success
  end

  test "should get edit" do
    get edit_missao_url(@missao)
    assert_response :success
  end

  test "should update missao" do
    patch missao_url(@missao), params: { missao: { curso_id: @missao.curso_id, descricao: @missao.descricao, nome: @missao.nome, usuario_curso_id: @missao.usuario_curso_id } }
    assert_redirected_to missao_url(@missao)
  end

  test "should destroy missao" do
    assert_difference('Missao.count', -1) do
      delete missao_url(@missao)
    end

    assert_redirected_to missoes_url
  end
end
