require "application_system_test_case"

class SalaChatsTest < ApplicationSystemTestCase
  setup do
    @sala_chat = salas_chats(:one)
  end

  test "visiting the index" do
    visit salas_chats_url
    assert_selector "h1", text: "Sala Chats"
  end

  test "creating a Sala chat" do
    visit salas_chats_url
    click_on "New Sala Chat"

    fill_in "Curso", with: @sala_chat.curso_id
    fill_in "Nome", with: @sala_chat.nome
    fill_in "Usuario", with: @sala_chat.usuario_id
    click_on "Create Sala chat"

    assert_text "Sala chat was successfully created"
    click_on "Back"
  end

  test "updating a Sala chat" do
    visit salas_chats_url
    click_on "Edit", match: :first

    fill_in "Curso", with: @sala_chat.curso_id
    fill_in "Nome", with: @sala_chat.nome
    fill_in "Usuario", with: @sala_chat.usuario_id
    click_on "Update Sala chat"

    assert_text "Sala chat was successfully updated"
    click_on "Back"
  end

  test "destroying a Sala chat" do
    visit salas_chats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sala chat was successfully destroyed"
  end
end
