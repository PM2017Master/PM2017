require 'test_helper'

class AdminOperateStaffsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_operate_staffs_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_operate_staffs_new_url
    assert_response :success
  end

end
