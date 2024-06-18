class CreatePowerBanks < ActiveRecord::Migration[7.1]
  def change
    create_table :power_banks do |t|
      t.decimal :charge
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
