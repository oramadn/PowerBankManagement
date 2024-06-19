require "test_helper"

class Admins::PowerBanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admins_power_bank = admins_power_banks(:one)
  end

  test "should get index" do
    get admins_power_banks_url
    assert_response :success
  end

  test "should get new" do
    get new_admins_power_bank_url
    assert_response :success
  end

  test "should create admins_power_bank" do
    assert_difference("Admins::PowerBank.count") do
      post admins_power_banks_url, params: { admins_power_bank: { charge: @admins_power_bank.charge, station_id: @admins_power_bank.station_id, status: @admins_power_bank.status, user_id: @admins_power_bank.user_id, warehouse_id: @admins_power_bank.warehouse_id } }
    end

    assert_redirected_to admins_power_bank_url(Admins::PowerBank.last)
  end

  test "should show admins_power_bank" do
    get admins_power_bank_url(@admins_power_bank)
    assert_response :success
  end

  test "should get edit" do
    get edit_admins_power_bank_url(@admins_power_bank)
    assert_response :success
  end

  test "should update admins_power_bank" do
    patch admins_power_bank_url(@admins_power_bank), params: { admins_power_bank: { charge: @admins_power_bank.charge, station_id: @admins_power_bank.station_id, status: @admins_power_bank.status, user_id: @admins_power_bank.user_id, warehouse_id: @admins_power_bank.warehouse_id } }
    assert_redirected_to admins_power_bank_url(@admins_power_bank)
  end

  test "should destroy admins_power_bank" do
    assert_difference("Admins::PowerBank.count", -1) do
      delete admins_power_bank_url(@admins_power_bank)
    end

    assert_redirected_to admins_power_banks_url
  end
end
