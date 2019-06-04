require 'test_helper'

class AtividadeExtrasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atividade_extra = atividade_extras(:one)
  end

  test "should get index" do
    get atividade_extras_url
    assert_response :success
  end

  test "should get new" do
    get new_atividade_extra_url
    assert_response :success
  end

  test "should create atividade_extra" do
    assert_difference('AtividadeExtra.count') do
      post atividade_extras_url, params: { atividade_extra: { descricao: @atividade_extra.descricao, modulo_id: @atividade_extra.modulo_id, pontuacao: @atividade_extra.pontuacao, usuario_curso_id: @atividade_extra.usuario_curso_id } }
    end

    assert_redirected_to atividade_extra_url(AtividadeExtra.last)
  end

  test "should show atividade_extra" do
    get atividade_extra_url(@atividade_extra)
    assert_response :success
  end

  test "should get edit" do
    get edit_atividade_extra_url(@atividade_extra)
    assert_response :success
  end

  test "should update atividade_extra" do
    patch atividade_extra_url(@atividade_extra), params: { atividade_extra: { descricao: @atividade_extra.descricao, modulo_id: @atividade_extra.modulo_id, pontuacao: @atividade_extra.pontuacao, usuario_curso_id: @atividade_extra.usuario_curso_id } }
    assert_redirected_to atividade_extra_url(@atividade_extra)
  end

  test "should destroy atividade_extra" do
    assert_difference('AtividadeExtra.count', -1) do
      delete atividade_extra_url(@atividade_extra)
    end

    assert_redirected_to atividade_extras_url
  end
end
