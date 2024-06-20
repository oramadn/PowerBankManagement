require 'test_helper'

class WarehouseTest < ActiveSupport::TestCase
  def setup
    @warehouse1 = warehouses(:warehouse1)
    @warehouse2 = warehouses(:warehouse2)
  end

  test "warehouse1 should be valid" do
    assert @warehouse1.valid?
  end

  test "warehouse2 should be valid" do
    assert @warehouse2.valid?
  end

  test "warehouse name should be present" do
    @warehouse1.name = nil
    assert_not @warehouse1.valid?
  end

  test "warehouse address should be present" do
    @warehouse1.address = nil
    assert_not @warehouse1.valid?
  end
end