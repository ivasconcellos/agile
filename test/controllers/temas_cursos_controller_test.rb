require 'test_helper'

class TemasCursosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tema_curso = temas_cursos(:one)
  end

  test "should get index" do
    get temas_cursos_url
    assert_response :success
  end

  test "should get new" do
    get new_tema_curso_url
    assert_response :success
  end

  test "should create tema_curso" do
    assert_difference('TemaCurso.count') do
      post temas_cursos_url, params: { tema_curso: { ativo: @tema_curso.ativo, cor_texto: @tema_curso.cor_texto, cor_titulo: @tema_curso.cor_titulo, nome: @tema_curso.nome } }
    end

    assert_redirected_to tema_curso_url(TemaCurso.last)
  end

  test "should show tema_curso" do
    get tema_curso_url(@tema_curso)
    assert_response :success
  end

  test "should get edit" do
    get edit_tema_curso_url(@tema_curso)
    assert_response :success
  end

  test "should update tema_curso" do
    patch tema_curso_url(@tema_curso), params: { tema_curso: { ativo: @tema_curso.ativo, cor_texto: @tema_curso.cor_texto, cor_titulo: @tema_curso.cor_titulo, nome: @tema_curso.nome } }
    assert_redirected_to tema_curso_url(@tema_curso)
  end

  test "should destroy tema_curso" do
    assert_difference('TemaCurso.count', -1) do
      delete tema_curso_url(@tema_curso)
    end

    assert_redirected_to temas_cursos_url
  end
end
