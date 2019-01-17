require 'test_helper'

class TarefaAlunosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tarefa_aluno = tarefa_alunos(:one)
  end

  test "should get index" do
    get tarefa_alunos_url
    assert_response :success
  end

  test "should get new" do
    get new_tarefa_aluno_url
    assert_response :success
  end

  test "should create tarefa_aluno" do
    assert_difference('TarefaAluno.count') do
      post tarefa_alunos_url, params: { tarefa_aluno: { comentario: @tarefa_aluno.comentario, nota: @tarefa_aluno.nota, tarefa_id: @tarefa_aluno.tarefa_id, usuario_curso: @tarefa_aluno.usuario_curso, usuario_curso_id: @tarefa_aluno.usuario_curso_id } }
    end

    assert_redirected_to tarefa_aluno_url(TarefaAluno.last)
  end

  test "should show tarefa_aluno" do
    get tarefa_aluno_url(@tarefa_aluno)
    assert_response :success
  end

  test "should get edit" do
    get edit_tarefa_aluno_url(@tarefa_aluno)
    assert_response :success
  end

  test "should update tarefa_aluno" do
    patch tarefa_aluno_url(@tarefa_aluno), params: { tarefa_aluno: { comentario: @tarefa_aluno.comentario, nota: @tarefa_aluno.nota, tarefa_id: @tarefa_aluno.tarefa_id, usuario_curso: @tarefa_aluno.usuario_curso, usuario_curso_id: @tarefa_aluno.usuario_curso_id } }
    assert_redirected_to tarefa_aluno_url(@tarefa_aluno)
  end

  test "should destroy tarefa_aluno" do
    assert_difference('TarefaAluno.count', -1) do
      delete tarefa_aluno_url(@tarefa_aluno)
    end

    assert_redirected_to tarefa_alunos_url
  end
end
