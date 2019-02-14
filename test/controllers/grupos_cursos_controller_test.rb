require 'test_helper'

class GruposCursosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grupo_curso = grupos_cursos(:one)
  end

  test "should get index" do
    get grupos_cursos_url
    assert_response :success
  end

  test "should get new" do
    get new_grupo_curso_url
    assert_response :success
  end

  test "should create grupo_curso" do
    assert_difference('GrupoCurso.count') do
      post grupos_cursos_url, params: { grupo_curso: { curso_id: @grupo_curso.curso_id, grupo_id: @grupo_curso.grupo_id, nome_curso: @grupo_curso.nome_curso } }
    end

    assert_redirected_to grupo_curso_url(GrupoCurso.last)
  end

  test "should show grupo_curso" do
    get grupo_curso_url(@grupo_curso)
    assert_response :success
  end

  test "should get edit" do
    get edit_grupo_curso_url(@grupo_curso)
    assert_response :success
  end

  test "should update grupo_curso" do
    patch grupo_curso_url(@grupo_curso), params: { grupo_curso: { curso_id: @grupo_curso.curso_id, grupo_id: @grupo_curso.grupo_id, nome_curso: @grupo_curso.nome_curso } }
    assert_redirected_to grupo_curso_url(@grupo_curso)
  end

  test "should destroy grupo_curso" do
    assert_difference('GrupoCurso.count', -1) do
      delete grupo_curso_url(@grupo_curso)
    end

    assert_redirected_to grupos_cursos_url
  end
end
