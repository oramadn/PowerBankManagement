require "test_helper"

class Users::LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_location = users_locations(:one)
  end

  test "should get index" do
    get users_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_users_location_url
    assert_response :success
  end

  test "should create users_location" do
    assert_difference("Users::Location.count") do
      post users_locations_url, params: { users_location: { lat: @users_location.lat, lng: @users_location.lng, name: @users_location.name } }
    end

    assert_redirected_to users_location_url(Users::Location.last)
  end

  test "should show users_location" do
    get users_location_url(@users_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_location_url(@users_location)
    assert_response :success
  end

  test "should update users_location" do
    patch users_location_url(@users_location), params: { users_location: { lat: @users_location.lat, lng: @users_location.lng, name: @users_location.name } }
    assert_redirected_to users_location_url(@users_location)
  end

  test "should destroy users_location" do
    assert_difference("Users::Location.count", -1) do
      delete users_location_url(@users_location)
    end

    assert_redirected_to users_locations_url
  end
end
