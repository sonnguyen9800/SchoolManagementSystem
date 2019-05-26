require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(name: "Example Course In Testing phase", prerequisite: "Example Prerequisite in testing phase", description: "Example Description of Example Course In the testing phase of the rails project")
  end
  
  test "Course should be valid" do
   assert @course.valid?
  end
  
  test "Check model valid" do
   assert @course.valid?
 end

 test "name should be present" do
    @course.name = "     "
    assert_not @course.valid?
  end

  test "name should have minimum length" do
    @course.name = "a" * 8
    assert_not @course.valid?
  end
  
  test "prerequisite should be present" do
      @course.prerequisite = "     "
      assert_not @course.valid?
  end
  
  test "prerequisite should have minimum length" do
      @course.prerequisite = "a" * 8
      assert_not @course.valid?
  end

  test "description should be present (nonblank)" do
   @course.description = "     "
   assert_not @course.valid?
 end

 test "description should have a minimum length" do
   @course.description = "a" * 28
   assert_not @course.valid?
 end
end
