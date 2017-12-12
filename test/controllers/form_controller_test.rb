require 'test_helper'

class FormControllerTest < ActionDispatch::IntegrationTest
  test "should get envio" do
    get form_envio_url
    assert_response :success
  end

  test "should get recibo" do
    get form_recibo_url
    assert_response :success
  end

end
