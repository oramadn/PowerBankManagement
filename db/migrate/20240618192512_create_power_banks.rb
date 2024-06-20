class CreatePowerBanks < ActiveRecord::Migration[7.1]
  def change
    create_table :power_banks do |t|
      t.decimal :charge
      t.string :status
      t.references :user, null: true, foreign_key: true
      t.references :station, null: true, foreign_key: true
      t.references :warehouse, null: true, foreign_key: true

      t.timestamps
    end
  end
end
