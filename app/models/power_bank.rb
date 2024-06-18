class PowerBank < ApplicationRecord
  belongs_to :user
  belongs_to :station
  belongs_to :warehouse
end
