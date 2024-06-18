class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
