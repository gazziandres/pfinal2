require 'test_helper'

class CrearPlatoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crear_plato_index_url
    assert_response :success
  end

end
