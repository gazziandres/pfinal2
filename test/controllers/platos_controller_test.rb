require 'test_helper'

class PlatosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get platos_index_url
    assert_response :success
  end

end
