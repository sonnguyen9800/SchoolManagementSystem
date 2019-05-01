require 'test_helper'

class CoordinatorTest < ActiveSupport::TestCase
  def setup
   @coordinator = Coordinator.new(name: "Example User", email: "firstname.secondname@rmit.edu.au", password: "toilaai12ASX@")
  end

 test "Check model valid" do
   assert @coordinator.valid?
 end

 test "name should be present" do
    @coordinator.name = "     "
    assert_not @coordinator.valid?
  end

  test "name should not be too long" do
    @coordinator.name = "a" * 51
    assert_not @coordinator.valid?
  end

  test "email should not be too long" do
    @coordinator.email = "a" * 244 + "@rmit.edu.au"
    assert_not @coordinator.valid?
  end

  test "password should be present (nonblank)" do
   @coordinator.password = @coordinator.password_confirmation = " " * 6
   assert_not @coordinator.valid?
 end

 test "password should have a minimum length" do
   @coordinator.password = @coordinator.password_confirmation = "a" * 5
   assert_not @coordinator.valid?
 end
end
