require 'test_helper'

class TarefaEntregarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tarefa_entregar = tarefa_entregars(:one)
  end

  test "should get index" do
    get tarefa_entregars_url
    assert_response :success
  end

  test "should get new" do
    get new_tarefa_entregar_url
    assert_response :success
  end

  test "should create tarefa_entregar" do
    assert_difference('TarefaEntregar.count') do
      post tarefa_entregars_url, params: { tarefa_entregar: { comentario: @tarefa_entregar.comentario, tarefa_id: @tarefa_entregar.tarefa_id, usuario_curso_id: @tarefa_entregar.usuario_curso_id } }
    end

    assert_redirected_to tarefa_entregar_url(TarefaEntregar.last)
  end

  test "should show tarefa_entregar" do
    get tarefa_entregar_url(@tarefa_entregar)
    assert_response :success
  end

  test "should get edit" do
    get edit_tarefa_entregar_url(@tarefa_entregar)
    assert_response :success
  end

  test "should update tarefa_entregar" do
    patch tarefa_entregar_url(@tarefa_entregar), params: { tarefa_entregar: { comentario: @tarefa_entregar.comentario, tarefa_id: @tarefa_entregar.tarefa_id, usuario_curso_id: @tarefa_entregar.usuario_curso_id } }
    assert_redirected_to tarefa_entregar_url(@tarefa_entregar)
  end

  test "should destroy tarefa_entregar" do
    assert_difference('TarefaEntregar.count', -1) do
      delete tarefa_entregar_url(@tarefa_entregar)
    end

    assert_redirected_to tarefa_entregars_url
  end
end
