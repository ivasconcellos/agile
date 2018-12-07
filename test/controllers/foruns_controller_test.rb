require 'test_helper'

class ForunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forum = foruns(:one)
  end

  test "should get index" do
    get foruns_url
    assert_response :success
  end

  test "should get new" do
    get new_forum_url
    assert_response :success
  end

  test "should create forum" do
    assert_difference('Forum.count') do
      post foruns_url, params: { forum: { curso_id: @forum.curso_id, descricao: @forum.descricao, titulo: @forum.titulo } }
    end

    assert_redirected_to forum_url(Forum.last)
  end

  test "should show forum" do
    get forum_url(@forum)
    assert_response :success
  end

  test "should get edit" do
    get edit_forum_url(@forum)
    assert_response :success
  end

  test "should update forum" do
    patch forum_url(@forum), params: { forum: { curso_id: @forum.curso_id, descricao: @forum.descricao, titulo: @forum.titulo } }
    assert_redirected_to forum_url(@forum)
  end

  test "should destroy forum" do
    assert_difference('Forum.count', -1) do
      delete forum_url(@forum)
    end

    assert_redirected_to foruns_url
  end
end
