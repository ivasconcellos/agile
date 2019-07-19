require 'test_helper'

class PontuacaoRemovidasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pontuacao_removida = pontuacao_removidas(:one)
  end

  test "should get index" do
    get pontuacao_removidas_url
    assert_response :success
  end

  test "should get new" do
    get new_pontuacao_removida_url
    assert_response :success
  end

  test "should create pontuacao_removida" do
    assert_difference('PontuacaoRemovida.count') do
      post pontuacao_removidas_url, params: { pontuacao_removida: { aluno_id: @pontuacao_removida.aluno_id, justificativa: @pontuacao_removida.justificativa, pontuacao: @pontuacao_removida.pontuacao, professor_id: @pontuacao_removida.professor_id } }
    end

    assert_redirected_to pontuacao_removida_url(PontuacaoRemovida.last)
  end

  test "should show pontuacao_removida" do
    get pontuacao_removida_url(@pontuacao_removida)
    assert_response :success
  end

  test "should get edit" do
    get edit_pontuacao_removida_url(@pontuacao_removida)
    assert_response :success
  end

  test "should update pontuacao_removida" do
    patch pontuacao_removida_url(@pontuacao_removida), params: { pontuacao_removida: { aluno_id: @pontuacao_removida.aluno_id, justificativa: @pontuacao_removida.justificativa, pontuacao: @pontuacao_removida.pontuacao, professor_id: @pontuacao_removida.professor_id } }
    assert_redirected_to pontuacao_removida_url(@pontuacao_removida)
  end

  test "should destroy pontuacao_removida" do
    assert_difference('PontuacaoRemovida.count', -1) do
      delete pontuacao_removida_url(@pontuacao_removida)
    end

    assert_redirected_to pontuacao_removidas_url
  end
end
