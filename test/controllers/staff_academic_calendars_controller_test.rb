require 'test_helper'

class StaffAcademicCalendarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_academic_calendars_index_url
    assert_response :success
  end

  test "should get new" do
    get staff_academic_calendars_new_url
    assert_response :success
  end

end
