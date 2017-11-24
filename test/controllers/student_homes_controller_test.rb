require 'test_helper'

class StudentHomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_homes_index_url
    assert_response :success
  end

end
