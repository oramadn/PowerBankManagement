class CreateStations < ActiveRecord::Migration[7.1]
  def change
    create_table :stations do |t|
      t.string :status
      t.references :location, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
