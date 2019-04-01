require "application_system_test_case"

class CursoCertificadosTest < ApplicationSystemTestCase
  setup do
    @curso_certificado = curso_certificados(:one)
  end

  test "visiting the index" do
    visit curso_certificados_url
    assert_selector "h1", text: "Curso Certificados"
  end

  test "creating a Curso certificado" do
    visit curso_certificados_url
    click_on "New Curso Certificado"

    fill_in "Curso", with: @curso_certificado.curso_id
    fill_in "Data Finalizacao", with: @curso_certificado.data_finalizacao
    fill_in "Hash Validacao", with: @curso_certificado.hash_validacao
    fill_in "Usuario", with: @curso_certificado.usuario_id
    click_on "Create Curso certificado"

    assert_text "Curso certificado was successfully created"
    click_on "Back"
  end

  test "updating a Curso certificado" do
    visit curso_certificados_url
    click_on "Edit", match: :first

    fill_in "Curso", with: @curso_certificado.curso_id
    fill_in "Data Finalizacao", with: @curso_certificado.data_finalizacao
    fill_in "Hash Validacao", with: @curso_certificado.hash_validacao
    fill_in "Usuario", with: @curso_certificado.usuario_id
    click_on "Update Curso certificado"

    assert_text "Curso certificado was successfully updated"
    click_on "Back"
  end

  test "destroying a Curso certificado" do
    visit curso_certificados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Curso certificado was successfully destroyed"
  end
end
