require 'test_helper'

class StudentIntensiveLecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_intensive_lectures_index_url
    assert_response :success
  end

  test "should get new" do
    get student_intensive_lectures_new_url
    assert_response :success
  end

end
