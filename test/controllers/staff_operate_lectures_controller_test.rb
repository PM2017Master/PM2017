require 'test_helper'

class StaffOperateLecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_operate_lectures_index_url
    assert_response :success
  end

  test "should get new" do
    get staff_operate_lectures_new_url
    assert_response :success
  end

end
