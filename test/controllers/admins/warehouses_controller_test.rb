require "test_helper"

class Admins::WarehousesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = admins(:admin1)
    sign_in @admin
    @warehouse = warehouses(:warehouse1)
  end

  test "should get index" do
    get admins_warehouses_path
    assert_response :success
  end

  test "should show warehouse" do
    get admins_warehouse_url(@warehouse)
    assert_response :success
  end

  test "should get new" do
    get new_admins_warehouse_url
    assert_response :success
  end

  test "should create warehouse" do
    assert_difference('Warehouse.count') do
      post admins_warehouses_path, params: { warehouse: { name: "New Warehouse", address: "123 Main St" } }
    end

    assert_redirected_to admins_warehouses_path
  end

  test "should get edit" do
    get edit_admins_warehouse_url(@warehouse)
    assert_response :success
  end

  test "should update warehouse" do
    patch admins_warehouse_url(@warehouse), params: { warehouse: { name: "Updated Warehouse", address: "456 Oak Ave" } }
    assert_redirected_to admins_warehouses_path
    @warehouse.reload
    assert_equal "Updated Warehouse", @warehouse.name
    assert_equal "456 Oak Ave", @warehouse.address
  end

  test "should destroy warehouse" do
    assert_difference('Warehouse.count', -1) do
      delete admins_warehouse_url(@warehouse)
    end

    assert_redirected_to admins_warehouses_url
  end
end
