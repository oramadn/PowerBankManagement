class PowerBank < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :station, optional: true
  belongs_to :warehouse, optional: true

  validates :charge, presence: true
  validates :status, presence: true
end
