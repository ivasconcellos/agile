require "application_system_test_case"

class AreasTest < ApplicationSystemTestCase
  setup do
    @area = areas(:one)
  end

  test "visiting the index" do
    visit areas_url
    assert_selector "h1", text: "Areas"
  end

  test "creating a Area" do
    visit areas_url
    click_on "New Area"

    check "Ativa" if @area.ativa
    fill_in "Nome", with: @area.nome
    click_on "Create Area"

    assert_text "Area was successfully created"
    click_on "Back"
  end

  test "updating a Area" do
    visit areas_url
    click_on "Edit", match: :first

    check "Ativa" if @area.ativa
    fill_in "Nome", with: @area.nome
    click_on "Update Area"

    assert_text "Area was successfully updated"
    click_on "Back"
  end

  test "destroying a Area" do
    visit areas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Area was successfully destroyed"
  end
end
