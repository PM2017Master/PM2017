require 'test_helper'

class AdminBaseControllerTest < ActionDispatch::IntegrationTest
  test "should get rogin" do
    get admin_base_rogin_url
    assert_response :success
  end

end
