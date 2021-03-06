require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:one)
  end


  test "should get new" do
    get new_location_url
    assert_response :success
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { name: @location.name } }
    assert_redirected_to location_url(@location)
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end

    assert_redirected_to locations_url
  end
end
