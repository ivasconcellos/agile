require 'test_helper'

class AvaliacaoTarefaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliacao_tarefa = avaliacao_tarefa(:one)
  end

  test "should get index" do
    get avaliacao_tarefa_index_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliacao_tarefa_url
    assert_response :success
  end

  test "should create avaliacao_tarefa" do
    assert_difference('AvaliacaoTarefa.count') do
      post avaliacao_tarefa_index_url, params: { avaliacao_tarefa: { comentario: @avaliacao_tarefa.comentario, nota: @avaliacao_tarefa.nota, tarefa_aluno_id: @avaliacao_tarefa.tarefa_aluno_id, usuario_curso_id: @avaliacao_tarefa.usuario_curso_id } }
    end

    assert_redirected_to avaliacao_tarefa_url(AvaliacaoTarefa.last)
  end

  test "should show avaliacao_tarefa" do
    get avaliacao_tarefa_url(@avaliacao_tarefa)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliacao_tarefa_url(@avaliacao_tarefa)
    assert_response :success
  end

  test "should update avaliacao_tarefa" do
    patch avaliacao_tarefa_url(@avaliacao_tarefa), params: { avaliacao_tarefa: { comentario: @avaliacao_tarefa.comentario, nota: @avaliacao_tarefa.nota, tarefa_aluno_id: @avaliacao_tarefa.tarefa_aluno_id, usuario_curso_id: @avaliacao_tarefa.usuario_curso_id } }
    assert_redirected_to avaliacao_tarefa_url(@avaliacao_tarefa)
  end

  test "should destroy avaliacao_tarefa" do
    assert_difference('AvaliacaoTarefa.count', -1) do
      delete avaliacao_tarefa_url(@avaliacao_tarefa)
    end

    assert_redirected_to avaliacao_tarefa_index_url
  end
end
