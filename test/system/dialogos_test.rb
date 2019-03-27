require "application_system_test_case"

class DialogosTest < ApplicationSystemTestCase
  setup do
    @dialogo = dialogos(:one)
  end

  test "visiting the index" do
    visit dialogos_url
    assert_selector "h1", text: "Dialogos"
  end

  test "creating a Dialogo" do
    visit dialogos_url
    click_on "New Dialogo"

    fill_in "Modulo", with: @dialogo.modulo_id
    fill_in "Texto", with: @dialogo.texto
    fill_in "Titulo", with: @dialogo.titulo
    fill_in "Usuario Curso", with: @dialogo.usuario_curso_id
    click_on "Create Dialogo"

    assert_text "Dialogo was successfully created"
    click_on "Back"
  end

  test "updating a Dialogo" do
    visit dialogos_url
    click_on "Edit", match: :first

    fill_in "Modulo", with: @dialogo.modulo_id
    fill_in "Texto", with: @dialogo.texto
    fill_in "Titulo", with: @dialogo.titulo
    fill_in "Usuario Curso", with: @dialogo.usuario_curso_id
    click_on "Update Dialogo"

    assert_text "Dialogo was successfully updated"
    click_on "Back"
  end

  test "destroying a Dialogo" do
    visit dialogos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dialogo was successfully destroyed"
  end
end
