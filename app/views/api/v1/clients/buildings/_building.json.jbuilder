json.extract! building, :id, :address1, :address2, :city, :state, :zip, :created_at, :updated_at
json.custom_freeform_field_values do
  json.array! building.custom_freeform_field_values do |custom_freeform_field_value|
    json.value custom_freeform_field_value.value
    json.field do
      json.id custom_freeform_field_value.custom_freeform_field.id
      json.name custom_freeform_field_value.custom_freeform_field.name
    end
  end
end
json.custom_number_field_values do
  json.array! building.custom_number_field_values do |custom_number_field_value|
    json.value custom_number_field_value.value
    json.field do
      json.id custom_number_field_value.custom_number_field.id
      json.name custom_number_field_value.custom_number_field.name
    end
  end
end
json.custom_enum_field_values do
  json.array! building.custom_enum_field_values do |custom_enum_field_value|
    json.field do
      json.id custom_enum_field_value.custom_enum_field_choice.custom_enum_field.id
      json.name custom_enum_field_value.custom_enum_field_choice.custom_enum_field.name
    end
    json.choice do
      json.id custom_enum_field_value.custom_enum_field_choice.id
      json.name custom_enum_field_value.custom_enum_field_choice.value
    end
  end
end
