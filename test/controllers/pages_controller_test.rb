require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get users page for user" do
    user = users(:user1)  # Assuming you have a fixture or factory set up for users
    sign_in user
    get users_page_url
    assert_response :success
  end

  test "should get admins page for admin" do
    admin = admins(:admin1)  # Assuming you have a fixture or factory set up for admins
    sign_in admin
    get admins_page_url
    assert_response :success
  end
end
