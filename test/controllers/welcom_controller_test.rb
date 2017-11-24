require 'test_helper'

class WelcomControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get welcom_home_url
    assert_response :success
  end

end
