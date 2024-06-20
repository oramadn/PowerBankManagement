require "test_helper"

class Admins::StationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = admins(:admin1)
    sign_in @admin
    @station = stations(:station1)
    @warehouse = warehouses(:warehouse1)
    @location = locations(:location1)
  end

  test "should get index" do
    get admins_stations_path
    assert_response :success
  end

  test "should show station" do
    get admins_station_path(@station)
    assert_response :success
  end

  test "should get new" do
    get new_admins_station_path
    assert_response :success
  end

  test "should create station" do
    assert_difference("Station.count") do
      post admins_stations_path, params: { station: { status: 'online', warehouse_id: @warehouse.id } }
    end
  
    assert_redirected_to admins_stations_path
  end  


  test "should get edit" do
    get edit_admins_station_path(@station)
    assert_response :success
  end

  test "should update station" do
    patch admins_station_path(@station), params: { station: { location_id: @location.id, status: 'offline', warehouse_id: nil } }
    assert_redirected_to admins_station_path
    @station.reload
    assert_equal 'offline', @station.status
    assert_equal 1, @station.location_id
    assert_nil nil, @station.warehouse_id
  end

  test "should destroy station" do
    assert_difference("Station.count", -1) do
      delete admins_station_path(@station)
    end

    assert_redirected_to admins_stations_path
  end
end
