require 'test_helper'

class AtividadeExtraAlunosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atividade_extra_aluno = atividade_extra_alunos(:one)
  end

  test "should get index" do
    get atividade_extra_alunos_url
    assert_response :success
  end

  test "should get new" do
    get new_atividade_extra_aluno_url
    assert_response :success
  end

  test "should create atividade_extra_aluno" do
    assert_difference('AtividadeExtraAluno.count') do
      post atividade_extra_alunos_url, params: { atividade_extra_aluno: { atividade_extra_id: @atividade_extra_aluno.atividade_extra_id, pontuacao: @atividade_extra_aluno.pontuacao, usuario_curso_id: @atividade_extra_aluno.usuario_curso_id } }
    end

    assert_redirected_to atividade_extra_aluno_url(AtividadeExtraAluno.last)
  end

  test "should show atividade_extra_aluno" do
    get atividade_extra_aluno_url(@atividade_extra_aluno)
    assert_response :success
  end

  test "should get edit" do
    get edit_atividade_extra_aluno_url(@atividade_extra_aluno)
    assert_response :success
  end

  test "should update atividade_extra_aluno" do
    patch atividade_extra_aluno_url(@atividade_extra_aluno), params: { atividade_extra_aluno: { atividade_extra_id: @atividade_extra_aluno.atividade_extra_id, pontuacao: @atividade_extra_aluno.pontuacao, usuario_curso_id: @atividade_extra_aluno.usuario_curso_id } }
    assert_redirected_to atividade_extra_aluno_url(@atividade_extra_aluno)
  end

  test "should destroy atividade_extra_aluno" do
    assert_difference('AtividadeExtraAluno.count', -1) do
      delete atividade_extra_aluno_url(@atividade_extra_aluno)
    end

    assert_redirected_to atividade_extra_alunos_url
  end
end
