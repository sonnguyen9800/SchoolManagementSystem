require 'test_helper'

class UpvotesControllerTest < ActionDispatch::IntegrationTest
   setup do
     @course = courses(:one)
   end
  
  test "should get create" do
    get upvotes_create_url(@course)
    assert_response :success
  end

  test "should get destroy" do
    get upvotes_destroy_url
    assert_response :success
  end

end
