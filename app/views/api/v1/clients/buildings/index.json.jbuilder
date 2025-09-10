json.status true
json.buildings do
  json.array! @buildings, partial: "api/v1/clients/buildings/building", as: :building
end
json.pagination @paging_metadata
