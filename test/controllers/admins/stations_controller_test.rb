require "test_helper"

class Admins::StationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admins_station = admins_stations(:one)
  end

  test "should get index" do
    get admins_stations_url
    assert_response :success
  end

  test "should get new" do
    get new_admins_station_url
    assert_response :success
  end

  test "should create admins_station" do
    assert_difference("Admins::Station.count") do
      post admins_stations_url, params: { admins_station: { location_id: @admins_station.location_id, status: @admins_station.status, warehouse_id: @admins_station.warehouse_id } }
    end

    assert_redirected_to admins_station_url(Admins::Station.last)
  end

  test "should show admins_station" do
    get admins_station_url(@admins_station)
    assert_response :success
  end

  test "should get edit" do
    get edit_admins_station_url(@admins_station)
    assert_response :success
  end

  test "should update admins_station" do
    patch admins_station_url(@admins_station), params: { admins_station: { location_id: @admins_station.location_id, status: @admins_station.status, warehouse_id: @admins_station.warehouse_id } }
    assert_redirected_to admins_station_url(@admins_station)
  end

  test "should destroy admins_station" do
    assert_difference("Admins::Station.count", -1) do
      delete admins_station_url(@admins_station)
    end

    assert_redirected_to admins_stations_url
  end
end
