require 'test_helper'

class RecompensasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recompensa = recompensas(:one)
  end

  test "should get index" do
    get recompensas_url
    assert_response :success
  end

  test "should get new" do
    get new_recompensa_url
    assert_response :success
  end

  test "should create recompensa" do
    assert_difference('Recompensa.count') do
      post recompensas_url, params: { recompensa: { curso_id: @recompensa.curso_id, descricao: @recompensa.descricao, nome: @recompensa.nome, posicao_ranking: @recompensa.posicao_ranking, usuario_curso_id: @recompensa.usuario_curso_id } }
    end

    assert_redirected_to recompensa_url(Recompensa.last)
  end

  test "should show recompensa" do
    get recompensa_url(@recompensa)
    assert_response :success
  end

  test "should get edit" do
    get edit_recompensa_url(@recompensa)
    assert_response :success
  end

  test "should update recompensa" do
    patch recompensa_url(@recompensa), params: { recompensa: { curso_id: @recompensa.curso_id, descricao: @recompensa.descricao, nome: @recompensa.nome, posicao_ranking: @recompensa.posicao_ranking, usuario_curso_id: @recompensa.usuario_curso_id } }
    assert_redirected_to recompensa_url(@recompensa)
  end

  test "should destroy recompensa" do
    assert_difference('Recompensa.count', -1) do
      delete recompensa_url(@recompensa)
    end

    assert_redirected_to recompensas_url
  end
end
