require "application_system_test_case"

class SalaChatsTest < ApplicationSystemTestCase
  setup do
    @sala_chat = sala_chat(:one)
  end

  test "visiting the index" do
    visit sala_chat_url
    assert_selector "h1", text: "Sala Chats"
  end

  test "creating a Sala chat" do
    visit sala_chat_url
    click_on "New Sala Chat"

    fill_in "Nome", with: @sala_chat.nome
    click_on "Create Sala chat"

    assert_text "Sala chat was successfully created"
    click_on "Back"
  end

  test "updating a Sala chat" do
    visit sala_chat_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @sala_chat.nome
    click_on "Update Sala chat"

    assert_text "Sala chat was successfully updated"
    click_on "Back"
  end

  test "destroying a Sala chat" do
    visit sala_chat_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sala chat was successfully destroyed"
  end
end
