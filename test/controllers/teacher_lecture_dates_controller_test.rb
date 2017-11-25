require 'test_helper'

class TeacherLectureDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teacher_lecture_dates_new_url
    assert_response :success
  end

end
