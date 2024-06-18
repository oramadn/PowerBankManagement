class Location < ApplicationRecord
    has_many :stations

    validates :name, presence: true
    validates :lat, presence: true
    validates :lng, presence: true
end
