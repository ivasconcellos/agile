require 'test_helper'

class AvataresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avatar = avatares(:one)
  end

  test "should get index" do
    get avatares_url
    assert_response :success
  end

  test "should get new" do
    get new_avatar_url
    assert_response :success
  end

  test "should create avatar" do
    assert_difference('Avatar.count') do
      post avatares_url, params: { avatar: { nome: @avatar.nome, perfil: @avatar.perfil, tema_curso_id: @avatar.tema_curso_id } }
    end

    assert_redirected_to avatar_url(Avatar.last)
  end

  test "should show avatar" do
    get avatar_url(@avatar)
    assert_response :success
  end

  test "should get edit" do
    get edit_avatar_url(@avatar)
    assert_response :success
  end

  test "should update avatar" do
    patch avatar_url(@avatar), params: { avatar: { nome: @avatar.nome, perfil: @avatar.perfil, tema_curso_id: @avatar.tema_curso_id } }
    assert_redirected_to avatar_url(@avatar)
  end

  test "should destroy avatar" do
    assert_difference('Avatar.count', -1) do
      delete avatar_url(@avatar)
    end

    assert_redirected_to avatares_url
  end
end
