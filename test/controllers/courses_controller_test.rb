require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
    @coordinator = coordinators(:two)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
