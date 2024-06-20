# test/models/station_test.rb

require 'test_helper'

class StationTest < ActiveSupport::TestCase
  def setup
    @station1 = stations(:station1)
    @station2 = stations(:station2)
  end

  test "station1 should be valid" do
    assert @station1.valid?
  end

  test "station2 should be valid" do
    assert @station2.valid?
  end

  test "status should be present" do
    @station1.status = nil
    assert_not @station1.valid?
  end

  test "location can be present" do
    @station1.location_id = locations(:location1).id
    assert @station1.valid?
  end

  test "warehouse can be present" do
    @station1.warehouse_id = warehouses(:warehouse1).id
    assert @station1.valid?
  end
end
