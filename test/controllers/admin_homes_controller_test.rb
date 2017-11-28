require 'test_helper'

class AdminHomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_homes_index_url
    assert_response :success
  end

end
