require "application_system_test_case"

class ConteudosTest < ApplicationSystemTestCase
  setup do
    @conteudo = conteudos(:one)
  end

  test "visiting the index" do
    visit conteudos_url
    assert_selector "h1", text: "Conteudos"
  end

  test "creating a Conteudo" do
    visit conteudos_url
    click_on "New Conteudo"

    fill_in "Curso", with: @conteudo.curso_id
    fill_in "Descricao", with: @conteudo.descricao
    fill_in "Nome", with: @conteudo.nome
    click_on "Create Conteudo"

    assert_text "Conteudo was successfully created"
    click_on "Back"
  end

  test "updating a Conteudo" do
    visit conteudos_url
    click_on "Edit", match: :first

    fill_in "Curso", with: @conteudo.curso_id
    fill_in "Descricao", with: @conteudo.descricao
    fill_in "Nome", with: @conteudo.nome
    click_on "Update Conteudo"

    assert_text "Conteudo was successfully updated"
    click_on "Back"
  end

  test "destroying a Conteudo" do
    visit conteudos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conteudo was successfully destroyed"
  end
end
