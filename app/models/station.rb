class Station < ApplicationRecord
  has_many :power_banks, dependent: :nullify

  belongs_to :location, optional: true
  belongs_to :warehouse, optional: true

  validates :status, presence: true
  validates :location_id, presence: true
  validates :warehouse_id, presence: true
end
