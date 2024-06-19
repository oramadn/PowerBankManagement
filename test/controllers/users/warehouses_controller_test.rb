require "test_helper"

class Users::WarehousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_warehouse = users_warehouses(:one)
  end

  test "should get index" do
    get users_warehouses_url
    assert_response :success
  end

  test "should get new" do
    get new_users_warehouse_url
    assert_response :success
  end

  test "should create users_warehouse" do
    assert_difference("Users::Warehouse.count") do
      post users_warehouses_url, params: { users_warehouse: { address: @users_warehouse.address, name: @users_warehouse.name } }
    end

    assert_redirected_to users_warehouse_url(Users::Warehouse.last)
  end

  test "should show users_warehouse" do
    get users_warehouse_url(@users_warehouse)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_warehouse_url(@users_warehouse)
    assert_response :success
  end

  test "should update users_warehouse" do
    patch users_warehouse_url(@users_warehouse), params: { users_warehouse: { address: @users_warehouse.address, name: @users_warehouse.name } }
    assert_redirected_to users_warehouse_url(@users_warehouse)
  end

  test "should destroy users_warehouse" do
    assert_difference("Users::Warehouse.count", -1) do
      delete users_warehouse_url(@users_warehouse)
    end

    assert_redirected_to users_warehouses_url
  end
end
