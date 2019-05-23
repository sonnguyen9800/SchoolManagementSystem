require 'test_helper'

class DownvotesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get downvotes_create_url
    assert_response :success
  end

end
