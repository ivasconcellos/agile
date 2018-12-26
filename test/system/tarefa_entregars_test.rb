require "application_system_test_case"

class TarefaEntregarsTest < ApplicationSystemTestCase
  setup do
    @tarefa_entregar = tarefa_entregars(:one)
  end

  test "visiting the index" do
    visit tarefa_entregars_url
    assert_selector "h1", text: "Tarefa Entregars"
  end

  test "creating a Tarefa entregar" do
    visit tarefa_entregars_url
    click_on "New Tarefa Entregar"

    fill_in "Comentario", with: @tarefa_entregar.comentario
    fill_in "Tarefa", with: @tarefa_entregar.tarefa_id
    fill_in "Usuario Curso", with: @tarefa_entregar.usuario_curso_id
    click_on "Create Tarefa entregar"

    assert_text "Tarefa entregar was successfully created"
    click_on "Back"
  end

  test "updating a Tarefa entregar" do
    visit tarefa_entregars_url
    click_on "Edit", match: :first

    fill_in "Comentario", with: @tarefa_entregar.comentario
    fill_in "Tarefa", with: @tarefa_entregar.tarefa_id
    fill_in "Usuario Curso", with: @tarefa_entregar.usuario_curso_id
    click_on "Update Tarefa entregar"

    assert_text "Tarefa entregar was successfully updated"
    click_on "Back"
  end

  test "destroying a Tarefa entregar" do
    visit tarefa_entregars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tarefa entregar was successfully destroyed"
  end
end
