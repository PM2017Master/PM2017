require 'test_helper'

class StudentLecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get student_lectures_new_url
    assert_response :success
  end

end
