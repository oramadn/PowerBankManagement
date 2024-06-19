json.extract! users_warehouse, :id, :name, :address, :created_at, :updated_at
json.url users_warehouse_url(users_warehouse, format: :json)
