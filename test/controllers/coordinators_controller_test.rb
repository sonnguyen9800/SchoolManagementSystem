require 'test_helper'

class CoordinatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coordinator = coordinators(:one)
  end

  test "should get index" do
    get coordinators_url
    assert_response :success
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should create coordinator" do
    get signup_path
    assert_no_difference 'Coordinator.count' do
      post coordinators_path, params: { coordinator: { name:  "TheNamOfTest",
                                         email: "user.user@rmit.edu.au",
                                         password:              "abcasd12XX12!",
                                         password_confirmation: "abcasd12XX12!" } }
    end
  end

  test "should show coordinator" do
    get coordinator_url(@coordinator)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@coordinator)
    get edit_coordinator_url(@coordinator)
    assert_response :success
  end

  test "should update coordinator" do
    log_in_as(@coordinator)
    patch coordinator_url(@coordinator), params: { coordinator: { email: @coordinator.email, name: @coordinator.name } }
    assert_redirected_to coordinator_url(@coordinator)
  end

  test "should destroy coordinator" do
    assert_difference('Coordinator.count', -1) do
      delete coordinator_url(@coordinator)
    end

    assert_redirected_to coordinators_url
  end
end
