require 'test_helper'

class AdminOperateAdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_operate_admins_edit_url
    assert_response :success
  end

end
