require 'test_helper'

class FeedbackControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedback = feedbacks(:one)
  end
  
  test "should get create" do
    patch feedback_create_url, params: {  feedback:  {subject: @feedback.subject, content: @feedback.content} }
    assert_response :success
  end

  test "should get destroy" do
    get feedback_destroy_url
    assert_response :success
  end

end
