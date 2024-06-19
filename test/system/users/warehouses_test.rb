require "application_system_test_case"

class Users::WarehousesTest < ApplicationSystemTestCase
  setup do
    @users_warehouse = users_warehouses(:one)
  end

  test "visiting the index" do
    visit users_warehouses_url
    assert_selector "h1", text: "Warehouses"
  end

  test "should create warehouse" do
    visit users_warehouses_url
    click_on "New warehouse"

    fill_in "Address", with: @users_warehouse.address
    fill_in "Name", with: @users_warehouse.name
    click_on "Create Warehouse"

    assert_text "Warehouse was successfully created"
    click_on "Back"
  end

  test "should update Warehouse" do
    visit users_warehouse_url(@users_warehouse)
    click_on "Edit this warehouse", match: :first

    fill_in "Address", with: @users_warehouse.address
    fill_in "Name", with: @users_warehouse.name
    click_on "Update Warehouse"

    assert_text "Warehouse was successfully updated"
    click_on "Back"
  end

  test "should destroy Warehouse" do
    visit users_warehouse_url(@users_warehouse)
    click_on "Destroy this warehouse", match: :first

    assert_text "Warehouse was successfully destroyed"
  end
end
