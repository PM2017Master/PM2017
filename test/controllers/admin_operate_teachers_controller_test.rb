require 'test_helper'

class AdminOperateTeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_operate_teachers_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_operate_teachers_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_operate_teachers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_operate_teachers_edit_url
    assert_response :success
  end

end
