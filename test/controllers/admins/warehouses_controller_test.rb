require "test_helper"

class Admins::WarehousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admins_warehouse = admins_warehouses(:one)
  end

  test "should get index" do
    get admins_warehouses_url
    assert_response :success
  end

  test "should get new" do
    get new_admins_warehouse_url
    assert_response :success
  end

  test "should create admins_warehouse" do
    assert_difference("Admins::Warehouse.count") do
      post admins_warehouses_url, params: { admins_warehouse: { address: @admins_warehouse.address, name: @admins_warehouse.name } }
    end

    assert_redirected_to admins_warehouse_url(Admins::Warehouse.last)
  end

  test "should show admins_warehouse" do
    get admins_warehouse_url(@admins_warehouse)
    assert_response :success
  end

  test "should get edit" do
    get edit_admins_warehouse_url(@admins_warehouse)
    assert_response :success
  end

  test "should update admins_warehouse" do
    patch admins_warehouse_url(@admins_warehouse), params: { admins_warehouse: { address: @admins_warehouse.address, name: @admins_warehouse.name } }
    assert_redirected_to admins_warehouse_url(@admins_warehouse)
  end

  test "should destroy admins_warehouse" do
    assert_difference("Admins::Warehouse.count", -1) do
      delete admins_warehouse_url(@admins_warehouse)
    end

    assert_redirected_to admins_warehouses_url
  end
end
