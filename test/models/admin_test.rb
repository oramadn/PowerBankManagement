require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  def setup
    @admin1 = admins(:admin1)
    @admin2 = admins(:admin2)
  end

  test "admin1 should be valid" do
    assert @admin1.valid?
  end

  test "admin2 should be valid" do
    assert @admin2.valid?
  end

  test "email should be present" do
    @admin1.email = nil
    assert_not @admin1.valid?
    assert_includes @admin1.errors.full_messages, "Email can't be blank"
  end

  test "password should be present" do
    new_admin = Admin.new(email: "testadmin@example.com", password: nil)
    assert_not new_admin.valid?
    assert_includes new_admin.errors.full_messages, "Password can't be blank"
  end

  test "password should have a minimum length" do
    new_admin = Admin.new(email: "test@example.com", password: "a" * 5)
    assert_not new_admin.valid?
    assert_includes new_admin.errors.full_messages, "Password is too short (minimum is 6 characters)"
  end
end
