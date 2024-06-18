require "application_system_test_case"

class Users::LocationsTest < ApplicationSystemTestCase
  setup do
    @users_location = users_locations(:one)
  end

  test "visiting the index" do
    visit users_locations_url
    assert_selector "h1", text: "Locations"
  end

  test "should create location" do
    visit users_locations_url
    click_on "New location"

    fill_in "Lat", with: @users_location.lat
    fill_in "Lng", with: @users_location.lng
    fill_in "Name", with: @users_location.name
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "should update Location" do
    visit users_location_url(@users_location)
    click_on "Edit this location", match: :first

    fill_in "Lat", with: @users_location.lat
    fill_in "Lng", with: @users_location.lng
    fill_in "Name", with: @users_location.name
    click_on "Update Location"

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "should destroy Location" do
    visit users_location_url(@users_location)
    click_on "Destroy this location", match: :first

    assert_text "Location was successfully destroyed"
  end
end
