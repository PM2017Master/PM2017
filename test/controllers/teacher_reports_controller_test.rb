require 'test_helper'

class TeacherReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teacher_reports_index_url
    assert_response :success
  end

  test "should get new" do
    get teacher_reports_new_url
    assert_response :success
  end

end
