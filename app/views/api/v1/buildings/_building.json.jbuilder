json.extract! building, :id, :address1, :address2, :city, :state, :zip, :created_at, :updated_at
json.url api_v1_building_url(building, format: :json)
json.client do
  json.id building.client.id
  json.name building.client.name
end
