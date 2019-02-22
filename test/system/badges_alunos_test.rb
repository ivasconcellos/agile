require "application_system_test_case"

class BadgeAlunosTest < ApplicationSystemTestCase
  setup do
    @badge_aluno = badges_alunos(:one)
  end

  test "visiting the index" do
    visit badges_alunos_url
    assert_selector "h1", text: "Badge Alunos"
  end

  test "creating a Badge aluno" do
    visit badges_alunos_url
    click_on "New Badge Aluno"

    fill_in "Badges", with: @badge_aluno.badges_id
    fill_in "Usuario Curso", with: @badge_aluno.usuario_curso_id
    click_on "Create Badge aluno"

    assert_text "Badge aluno was successfully created"
    click_on "Back"
  end

  test "updating a Badge aluno" do
    visit badges_alunos_url
    click_on "Edit", match: :first

    fill_in "Badges", with: @badge_aluno.badges_id
    fill_in "Usuario Curso", with: @badge_aluno.usuario_curso_id
    click_on "Update Badge aluno"

    assert_text "Badge aluno was successfully updated"
    click_on "Back"
  end

  test "destroying a Badge aluno" do
    visit badges_alunos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Badge aluno was successfully destroyed"
  end
end
