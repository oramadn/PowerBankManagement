require 'test_helper'

class Admins::LocationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = admins(:admin1) 
    sign_in @admin
    @location = locations(:location1)
  end

  test "should get index" do
    get admins_locations_path
    assert_response :success
  end

  test "should show location" do
    get admins_location_url(@location)
    assert_response :success
  end

  test "should get new" do
    get new_admins_location_url
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post admins_locations_path, params: { location: { name: "New Location", lat: 1.23, lng: 4.56 } }
    end

    assert_redirected_to admins_locations_path
  end

  test "should get edit" do
    get edit_admins_location_path(@location)
    assert_response :success
  end

  test "should update location" do
    patch admins_location_url(@location), params: { location: { name: "Updated Location", lat: 2.34, lng: 5.67 } }
    assert_redirected_to admins_locations_path
    @location.reload
    assert_equal "Updated Location", @location.name
    assert_equal 2.34, @location.lat.to_f
    assert_equal 5.67, @location.lng.to_f
  end  

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete admins_location_url(@location)
    end

    assert_redirected_to admins_locations_url
  end
end
