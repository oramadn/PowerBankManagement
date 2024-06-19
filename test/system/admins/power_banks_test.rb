require "application_system_test_case"

class Admins::PowerBanksTest < ApplicationSystemTestCase
  setup do
    @admins_power_bank = admins_power_banks(:one)
  end

  test "visiting the index" do
    visit admins_power_banks_url
    assert_selector "h1", text: "Power banks"
  end

  test "should create power bank" do
    visit admins_power_banks_url
    click_on "New power bank"

    fill_in "Charge", with: @admins_power_bank.charge
    fill_in "Station", with: @admins_power_bank.station_id
    fill_in "Status", with: @admins_power_bank.status
    fill_in "User", with: @admins_power_bank.user_id
    fill_in "Warehouse", with: @admins_power_bank.warehouse_id
    click_on "Create Power bank"

    assert_text "Power bank was successfully created"
    click_on "Back"
  end

  test "should update Power bank" do
    visit admins_power_bank_url(@admins_power_bank)
    click_on "Edit this power bank", match: :first

    fill_in "Charge", with: @admins_power_bank.charge
    fill_in "Station", with: @admins_power_bank.station_id
    fill_in "Status", with: @admins_power_bank.status
    fill_in "User", with: @admins_power_bank.user_id
    fill_in "Warehouse", with: @admins_power_bank.warehouse_id
    click_on "Update Power bank"

    assert_text "Power bank was successfully updated"
    click_on "Back"
  end

  test "should destroy Power bank" do
    visit admins_power_bank_url(@admins_power_bank)
    click_on "Destroy this power bank", match: :first

    assert_text "Power bank was successfully destroyed"
  end
end
