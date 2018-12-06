require "application_system_test_case"

class ForunsTest < ApplicationSystemTestCase
  setup do
    @forum = foruns(:one)
  end

  test "visiting the index" do
    visit foruns_url
    assert_selector "h1", text: "Foruns"
  end

  test "creating a Forum" do
    visit foruns_url
    click_on "New Forum"

    fill_in "Curso", with: @forum.curso_id
    fill_in "Descricao", with: @forum.descricao
    fill_in "Titulo", with: @forum.titulo
    click_on "Create Forum"

    assert_text "Forum was successfully created"
    click_on "Back"
  end

  test "updating a Forum" do
    visit foruns_url
    click_on "Edit", match: :first

    fill_in "Curso", with: @forum.curso_id
    fill_in "Descricao", with: @forum.descricao
    fill_in "Titulo", with: @forum.titulo
    click_on "Update Forum"

    assert_text "Forum was successfully updated"
    click_on "Back"
  end

  test "destroying a Forum" do
    visit foruns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forum was successfully destroyed"
  end
end
