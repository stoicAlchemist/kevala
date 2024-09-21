require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:one)
    @empty_location = locations(:empty)
  end

  test "should get index" do
    get locations_url
    assert_response :success
  end

  test "should get new" do
    get new_location_url
    assert_response :success
  end

  test "should create location" do
    assert_difference("Location.count") do
      post locations_url, params: { location: { name: @location.name } }
    end

    assert_redirected_to location_url(Location.last)
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { name: @location.name } }
    assert_redirected_to location_url(@location)
  end

  test "should not destroy a location with assigned shifts" do
    assert_difference("Location.count", 0) do
      delete location_url(@location)
    end

    assert_response :unprocessable_entity
  end

  test "should destroy an empty location" do
    assert_difference("Location.count", -1) do
      delete location_url(@empty_location)
    end

    assert_redirected_to locations_url
  end
end
