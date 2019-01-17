require "application_system_test_case"

class MateriaisTest < ApplicationSystemTestCase
  setup do
    @material = materiais(:one)
  end

  test "visiting the index" do
    visit materiais_url
    assert_selector "h1", text: "Materiais"
  end

  test "creating a Material" do
    visit materiais_url
    click_on "New Material"

    fill_in "modulo", with: @material.modulo_id
    fill_in "Descricao", with: @material.descricao
    fill_in "Link", with: @material.link
    fill_in "Nome", with: @material.nome
    click_on "Create Material"

    assert_text "Material was successfully created"
    click_on "Back"
  end

  test "updating a Material" do
    visit materiais_url
    click_on "Edit", match: :first

    fill_in "modulo", with: @material.modulo_id
    fill_in "Descricao", with: @material.descricao
    fill_in "Link", with: @material.link
    fill_in "Nome", with: @material.nome
    click_on "Update Material"

    assert_text "Material was successfully updated"
    click_on "Back"
  end

  test "destroying a Material" do
    visit materiais_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Material was successfully destroyed"
  end
end
