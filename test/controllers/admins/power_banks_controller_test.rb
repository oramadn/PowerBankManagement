require "test_helper"

class Admins::PowerBanksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = admins(:admin1)
    @user = users(:user1)
    sign_in @admin
    @power_bank = power_banks(:power_bank1)
  end

  test "should get index" do
    get admins_power_banks_path
    assert_response :success
  end

  test "should show power_bank" do
    get admins_power_bank_path(@power_bank)
    assert_response :success
  end

  test "should get new" do
    get new_admins_power_bank_path
    assert_response :success
  end

  test "should create power_bank" do
    assert_difference("PowerBank.count") do
      post admins_power_banks_path, params: { power_bank: { charge: 60.1, status: "available"} }
    end
  
    assert_redirected_to admins_power_banks_path
  end  


  test "should get edit" do
    get edit_admins_power_bank_path(@power_bank)
    assert_response :success
  end

  test "should update power_bank" do
    patch admins_power_bank_path(@power_bank), params: { power_bank: { charge: "65", user_id: @user.id ,status: "reserved" } }
    assert_redirected_to admins_power_banks_path(@power_bank)
    @power_bank.reload
    assert_equal 65.0, @power_bank.charge.to_f
    assert_equal 1, @power_bank.user_id
    assert_equal "reserved", @power_bank.status # Assinging a user reserves the power bank
  end

  test "should destroy power_bank" do
    assert_difference("PowerBank.count", -1) do
      delete admins_power_bank_path(@power_bank)
    end

    assert_redirected_to admins_power_banks_path
  end
end
