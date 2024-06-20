class MakeLocationAndWarehouseNullableInStations < ActiveRecord::Migration[7.1]
  def change
    change_column_null :stations, :location_id, true
    change_column_null :stations, :warehouse_id, true
  end
end
