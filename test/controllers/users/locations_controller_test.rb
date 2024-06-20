require "test_helper"

class Users::LocationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:user1)
    sign_in @user
    @location = locations(:location1)
  end

  test "should get index" do
    get users_locations_url
    assert_response :success
  end

  test "should show location" do
    get users_locations_path(@location)
    assert_response :success
  end

  test "should not create location" do
    post users_locations_url, params: { location: { lat: 1.23, lng: 4.56, name: "Test Location" } }
    assert_response :not_found
  end

  test "should not update location" do
    patch users_location_url(@location), params: { location: { lat: 1.23, lng: 4.56, name: "Updated Name" } }
    assert_response :not_found
  end

  test "should not destroy location" do
    delete users_location_url(@location)
    assert_response :not_found
  end
end
