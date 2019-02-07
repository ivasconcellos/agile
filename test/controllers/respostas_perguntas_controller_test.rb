require 'test_helper'

class RespostasPerguntasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resposta_pergunta = respostas_perguntas(:one)
  end

  test "should get index" do
    get respostas_perguntas_url
    assert_response :success
  end

  test "should get new" do
    get new_resposta_pergunta_url
    assert_response :success
  end

  test "should create resposta_pergunta" do
    assert_difference('RespostaPergunta.count') do
      post respostas_perguntas_url, params: { resposta_pergunta: { comentario: @resposta_pergunta.comentario, correta: @resposta_pergunta.correta, descricao: @resposta_pergunta.descricao, pergunta_id: @resposta_pergunta.pergunta_id } }
    end

    assert_redirected_to resposta_pergunta_url(RespostaPergunta.last)
  end

  test "should show resposta_pergunta" do
    get resposta_pergunta_url(@resposta_pergunta)
    assert_response :success
  end

  test "should get edit" do
    get edit_resposta_pergunta_url(@resposta_pergunta)
    assert_response :success
  end

  test "should update resposta_pergunta" do
    patch resposta_pergunta_url(@resposta_pergunta), params: { resposta_pergunta: { comentario: @resposta_pergunta.comentario, correta: @resposta_pergunta.correta, descricao: @resposta_pergunta.descricao, pergunta_id: @resposta_pergunta.pergunta_id } }
    assert_redirected_to resposta_pergunta_url(@resposta_pergunta)
  end

  test "should destroy resposta_pergunta" do
    assert_difference('RespostaPergunta.count', -1) do
      delete resposta_pergunta_url(@resposta_pergunta)
    end

    assert_redirected_to respostas_perguntas_url
  end
end
