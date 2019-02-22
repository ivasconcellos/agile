require 'test_helper'

class ArtefatosAlunosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artefato_aluno = artefatos_alunos(:one)
  end

  test "should get index" do
    get artefatos_alunos_url
    assert_response :success
  end

  test "should get new" do
    get new_artefato_aluno_url
    assert_response :success
  end

  test "should create artefato_aluno" do
    assert_difference('ArtefatoAluno.count') do
      post artefatos_alunos_url, params: { artefato_aluno: { artefatos_id: @artefato_aluno.artefatos_id, usuario_curso_id: @artefato_aluno.usuario_curso_id } }
    end

    assert_redirected_to artefato_aluno_url(ArtefatoAluno.last)
  end

  test "should show artefato_aluno" do
    get artefato_aluno_url(@artefato_aluno)
    assert_response :success
  end

  test "should get edit" do
    get edit_artefato_aluno_url(@artefato_aluno)
    assert_response :success
  end

  test "should update artefato_aluno" do
    patch artefato_aluno_url(@artefato_aluno), params: { artefato_aluno: { artefatos_id: @artefato_aluno.artefatos_id, usuario_curso_id: @artefato_aluno.usuario_curso_id } }
    assert_redirected_to artefato_aluno_url(@artefato_aluno)
  end

  test "should destroy artefato_aluno" do
    assert_difference('ArtefatoAluno.count', -1) do
      delete artefato_aluno_url(@artefato_aluno)
    end

    assert_redirected_to artefatos_alunos_url
  end
end
