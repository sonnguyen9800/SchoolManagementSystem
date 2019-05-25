require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @category = Category.new(name: "Example Category")
  end
  
  test "should be valid" do
    assert @category.valid?
  end
  
  test "name should be present" do
    @category.name = "     "
    assert_not @category.valid?
  end
end
