require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(name: "Example Course In Testing phase", prerequisite: "Example Prerequisite in testing phase", description: "Example Description of Example Course In the testing phase of the rails project")
  end
  
  test "Course should be valid" do
   assert @course.valid?
  end
end
