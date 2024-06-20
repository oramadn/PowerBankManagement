require "test_helper"

class LocationTest < ActiveSupport::TestCase
  def setup
    @location1 = locations(:location1)
    @location2 = locations(:location2)
  end

  test "location1 should be valid" do
    assert @location1.valid?
  end

  test "location2 should be valid" do
    assert @location2.valid?
  end

  test "name should be present" do
    @location1.name = nil
    assert_not @location1.valid?
  end

  test "lat should be present" do
    @location1.lat = nil
    assert_not @location1.valid?
  end

  test "lng should be present" do
    @location1.lng = nil
    assert_not @location1.valid?
  end
end
