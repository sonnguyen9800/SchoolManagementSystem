require 'test_helper'

class CoordinatorsSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Coordinator.count' do
      post coordinators_path, params: { coordinator: { name:  "TheNamOfTest",
                                         email: "user.user@rmit.edu.au",
                                         password:              "abcasd12XX12!",
                                         password_confirmation: "abcasd12XX12!" } }
    end
  end
end
