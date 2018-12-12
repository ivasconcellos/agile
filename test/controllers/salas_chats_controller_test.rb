require 'test_helper'

class SalasChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sala_chat = salas_chats(:one)
  end

  test "should get index" do
    get salas_chats_url
    assert_response :success
  end

  test "should get new" do
    get new_sala_chat_url
    assert_response :success
  end

  test "should create sala_chat" do
    assert_difference('SalaChat.count') do
      post salas_chats_url, params: { sala_chat: { curso_id: @sala_chat.curso_id, nome: @sala_chat.nome, usuario_id: @sala_chat.usuario_id } }
    end

    assert_redirected_to sala_chat_url(SalaChat.last)
  end

  test "should show sala_chat" do
    get sala_chat_url(@sala_chat)
    assert_response :success
  end

  test "should get edit" do
    get edit_sala_chat_url(@sala_chat)
    assert_response :success
  end

  test "should update sala_chat" do
    patch sala_chat_url(@sala_chat), params: { sala_chat: { curso_id: @sala_chat.curso_id, nome: @sala_chat.nome, usuario_id: @sala_chat.usuario_id } }
    assert_redirected_to sala_chat_url(@sala_chat)
  end

  test "should destroy sala_chat" do
    assert_difference('SalaChat.count', -1) do
      delete sala_chat_url(@sala_chat)
    end

    assert_redirected_to salas_chats_url
  end
end
