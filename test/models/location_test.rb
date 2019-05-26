require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = Location.new(name: "Example Location")
  end
  
  test "should be valid" do
    assert @location.valid?
  end
  
  test "name should be present" do
    @location.name = "     "
    assert_not @location.valid?
  end
end
