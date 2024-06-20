require "test_helper"

class PowerBankTest < ActiveSupport::TestCase
  def setup
    @power_bank1 = power_banks(:power_bank1)
    @power_bank2 = power_banks(:power_bank2)
  end

  test "power_bank1 should be valid" do
    assert @power_bank1.valid?
  end

  test "power_bank2 should be valid" do
    assert @power_bank2.valid?
  end

  test "status should be present" do
    @power_bank1.status = nil
    assert_not @power_bank1.valid?
  end

  test "user_id can be present" do
    @power_bank1.user_id = users(:user1).id
    assert @power_bank1.valid?
  end

  test "station_id can be present" do
    @power_bank1.station_id = stations(:station1).id
    assert @power_bank1.valid?
  end

  test "warehouse_id can be present" do
    @power_bank1.warehouse_id = warehouses(:warehouse1).id
    assert @power_bank1.valid?
  end
end
