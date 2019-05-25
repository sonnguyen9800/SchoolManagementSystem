require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  def setup
    @feedback = Feedback.new(subject: "Example Subject", content: "Example Content")
  end
  
  test "should be valid" do
    assert @feedback.valid?
  end
  
  test "Subject should be present" do
    @feedback.subject = "     "
    assert_not @feedback.valid?
  end
  
  test "Content should be present" do
    @feedback.content = "     "
    assert_not @feedback.valid?
  end
end
