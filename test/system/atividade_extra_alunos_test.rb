require "application_system_test_case"

class AtividadeExtraAlunosTest < ApplicationSystemTestCase
  setup do
    @atividade_extra_aluno = atividade_extra_alunos(:one)
  end

  test "visiting the index" do
    visit atividade_extra_alunos_url
    assert_selector "h1", text: "Atividade Extra Alunos"
  end

  test "creating a Atividade extra aluno" do
    visit atividade_extra_alunos_url
    click_on "New Atividade Extra Aluno"

    fill_in "Atividade extra", with: @atividade_extra_aluno.atividade_extra_id
    fill_in "Pontuacao", with: @atividade_extra_aluno.pontuacao
    fill_in "Usuario curso", with: @atividade_extra_aluno.usuario_curso_id
    click_on "Create Atividade extra aluno"

    assert_text "Atividade extra aluno was successfully created"
    click_on "Back"
  end

  test "updating a Atividade extra aluno" do
    visit atividade_extra_alunos_url
    click_on "Edit", match: :first

    fill_in "Atividade extra", with: @atividade_extra_aluno.atividade_extra_id
    fill_in "Pontuacao", with: @atividade_extra_aluno.pontuacao
    fill_in "Usuario curso", with: @atividade_extra_aluno.usuario_curso_id
    click_on "Update Atividade extra aluno"

    assert_text "Atividade extra aluno was successfully updated"
    click_on "Back"
  end

  test "destroying a Atividade extra aluno" do
    visit atividade_extra_alunos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Atividade extra aluno was successfully destroyed"
  end
end
