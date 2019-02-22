require 'test_helper'

class BadgesAlunosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @badge_aluno = badges_alunos(:one)
  end

  test "should get index" do
    get badges_alunos_url
    assert_response :success
  end

  test "should get new" do
    get new_badge_aluno_url
    assert_response :success
  end

  test "should create badge_aluno" do
    assert_difference('BadgeAluno.count') do
      post badges_alunos_url, params: { badge_aluno: { badges_id: @badge_aluno.badges_id, usuario_curso_id: @badge_aluno.usuario_curso_id } }
    end

    assert_redirected_to badge_aluno_url(BadgeAluno.last)
  end

  test "should show badge_aluno" do
    get badge_aluno_url(@badge_aluno)
    assert_response :success
  end

  test "should get edit" do
    get edit_badge_aluno_url(@badge_aluno)
    assert_response :success
  end

  test "should update badge_aluno" do
    patch badge_aluno_url(@badge_aluno), params: { badge_aluno: { badges_id: @badge_aluno.badges_id, usuario_curso_id: @badge_aluno.usuario_curso_id } }
    assert_redirected_to badge_aluno_url(@badge_aluno)
  end

  test "should destroy badge_aluno" do
    assert_difference('BadgeAluno.count', -1) do
      delete badge_aluno_url(@badge_aluno)
    end

    assert_redirected_to badges_alunos_url
  end
end
