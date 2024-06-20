require "test_helper"

class Users::StationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:user1)
    sign_in @user
    @station = stations(:station1)
  end

  test "should get index" do
    get users_stations_url
    assert_response :success
  end

  test "should show station" do
    get users_stations_path(@station)
    assert_response :success
  end

  test "should not create station" do
    post users_stations_url, params: { station: { status: "offline"} }
    assert_response :not_found
  end

  test "should not update station" do
    patch users_station_url(@station), params: { station: { status: "offline"} }
    assert_response :not_found
  end

  test "should not destroy station" do
    delete users_station_url(@station)
    assert_response :not_found
  end
end
