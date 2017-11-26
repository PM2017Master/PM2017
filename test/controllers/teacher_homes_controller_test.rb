require 'test_helper'

class TeacherHomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teacher_homes_index_url
    assert_response :success
  end

end
