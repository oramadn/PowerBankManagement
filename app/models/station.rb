class Station < ApplicationRecord
  has_many :power_banks

  belongs_to :location, optional: true
  belongs_to :warehouse, optional: true

  validates :status, presence: true
end
