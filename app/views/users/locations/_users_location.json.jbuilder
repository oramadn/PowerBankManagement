json.extract! users_location, :id, :name, :lat, :lng, :created_at, :updated_at
json.url users_location_url(users_location, format: :json)
