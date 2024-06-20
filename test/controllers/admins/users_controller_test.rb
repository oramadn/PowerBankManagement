require 'test_helper'

class Admins::UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = admins(:admin1)  # Adjust according to your fixture or setup
    sign_in @admin
    @user = users(:user1)  # Adjust according to your fixture or setup
  end

  test "should get index" do
    get admins_users_path
    assert_response :success
  end

  test "should show user" do
    get admins_user_url(@user)
    assert_response :success
  end

  test "should get new" do
    get new_admins_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post admins_users_path, params: { user: { email: "new_user@example.com", password: "password", password_confirmation: "password", name: "John", mobile_number: "00962797148233" } }
    end

    assert_redirected_to admins_users_path
  end

  # test "should get edit" do               Need fixing
  #   get edit_admins_user_url(@user)
  #   assert_response :not_found
  # end

  # test "should update user" do
  #   patch admins_user_url(@user), params: { user: { email: "updated_user@example.com" } }
  #   assert_response :not_found
  # end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete admins_user_url(@user)
    end

    assert_redirected_to admins_users_path
  end
end
