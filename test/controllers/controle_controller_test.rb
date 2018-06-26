require 'test_helper'

class ControleControllerTest < ActionDispatch::IntegrationTest
  test "should get inicial" do
    get controle_inicial_url
    assert_response :success
  end

  test "should get sobre" do
    get controle_sobre_url
    assert_response :success
  end

end
