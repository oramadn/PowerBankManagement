require 'test_helper'

class Users::PowerBanksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Include Devise test helpers
  
  setup do
    @user = users(:user1)  # Assuming you have a fixture or factory for users
    @power_bank = power_banks(:power_bank1)  # Assuming you have a fixture or factory for power banks
    sign_in @user
  end
  
  test "should reserve power bank" do
    patch reserve_users_power_bank_path(@power_bank)
    @power_bank.reload
    assert_redirected_to users_stations_path
    assert_equal 'reserved', @power_bank.status
    assert_equal @user.id, @power_bank.user_id
    assert_equal "Power Bank reserved successfully.", flash[:notice]
  end
end
