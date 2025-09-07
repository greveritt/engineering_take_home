FactoryBot.define do
  factory :custom_number_field_value do
    value { Faker::Number.decimal }
    custom_number_field
    building
  end
end
