# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
clients = Array.new(5) { Client.create!(name: Faker::Company.name) }
clients.each do |client|
  freeform_field = client.custom_freeform_fields.create!(name: Faker::Construction.role)
  number_field = client.custom_number_fields.create!(name: Faker::Name.first_name)
  enum_field = client.custom_enum_fields.create!(name: "Personnel bank ##{Faker::Number.unique.digit}")
  enum_field_choices = Array.new(3) { CustomEnumFieldChoice.create!(custom_enum_field: enum_field, value: Faker::Name.last_name) }
  5.times do
    client.buildings.create!(
      address1: Faker::Address.street_address,
      address2: Faker::Address.secondary_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip_code,
      custom_enum_field_values: [ CustomEnumFieldValue.new(custom_enum_field_choice: enum_field_choices.sample) ],
      custom_number_field_values: [ CustomNumberFieldValue.new(custom_number_field: number_field, value: Faker::Number.number) ],
      custom_freeform_field_values: [ CustomFreeformFieldValue.new(custom_freeform_field: freeform_field, value: Faker::Adjective.positive) ]
    )
  end
end
