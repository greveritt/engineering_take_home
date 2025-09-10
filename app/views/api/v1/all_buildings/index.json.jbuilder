json.status true
json.buildings do
  json.array! @buildings, partial: "api/v1/all_buildings/building", as: :building
end
