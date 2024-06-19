require "application_system_test_case"

class Admins::StationsTest < ApplicationSystemTestCase
  setup do
    @admins_station = admins_stations(:one)
  end

  test "visiting the index" do
    visit admins_stations_url
    assert_selector "h1", text: "Stations"
  end

  test "should create station" do
    visit admins_stations_url
    click_on "New station"

    fill_in "Location", with: @admins_station.location_id
    fill_in "Status", with: @admins_station.status
    fill_in "Warehouse", with: @admins_station.warehouse_id
    click_on "Create Station"

    assert_text "Station was successfully created"
    click_on "Back"
  end

  test "should update Station" do
    visit admins_station_url(@admins_station)
    click_on "Edit this station", match: :first

    fill_in "Location", with: @admins_station.location_id
    fill_in "Status", with: @admins_station.status
    fill_in "Warehouse", with: @admins_station.warehouse_id
    click_on "Update Station"

    assert_text "Station was successfully updated"
    click_on "Back"
  end

  test "should destroy Station" do
    visit admins_station_url(@admins_station)
    click_on "Destroy this station", match: :first

    assert_text "Station was successfully destroyed"
  end
end
