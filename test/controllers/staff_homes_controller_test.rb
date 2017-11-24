require 'test_helper'

class StaffHomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_homes_index_url
    assert_response :success
  end

end
