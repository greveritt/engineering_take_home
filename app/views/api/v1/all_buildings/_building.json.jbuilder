json.extract! building, :id, :address1, :address2, :city, :state, :zip, :created_at, :updated_at
json.client_name building.client.name
# building.custom_enum_fields.each do |field|
#   json.send(field.name, building.custom_enum_field_values.select { |v|(custom_enum_field: field))
# end
