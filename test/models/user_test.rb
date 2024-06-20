# test/models/user_test.rb

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:user1)
    @user2 = users(:user2)
  end

  test "user1 should be valid" do
    assert @user1.valid?
  end

  test "user2 should be valid" do
    assert @user2.valid?
  end

  test "email should be present" do
    @user1.email = nil
    assert_not @user1.valid?
  end

  test "password should be present" do
    new_user = Admin.new(email: "testuser@example.com", password: nil)
    assert_not new_user.valid?
    assert_includes new_user.errors.full_messages, "Password can't be blank"
  end

  test "name should be present" do
    @user1.name = nil
    assert_not @user1.valid?
  end

  test "mobile_number should be present" do
    @user1.mobile_number = nil
    assert_not @user1.valid?
  end

  test "mobile_number should be exactly 14 digits" do
    @user1.mobile_number = "123456789012345" # 15 digits
    assert_not @user1.valid?

    @user1.mobile_number = "123456789012"    # 12 digits
    assert_not @user1.valid?

    @user1.mobile_number = "12345678901234"  # 14 digits
    assert @user1.valid?
  end

  test "email should be unique" do
    duplicate_user = @user1.dup
    @user1.save
    assert_not duplicate_user.valid?
  end

  test "password should have a minimum length" do
    @user1.password = "a" * 5
    assert_not @user1.valid?
  end
end