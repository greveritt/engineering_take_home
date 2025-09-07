FactoryBot.define do
  factory :custom_enum_field_value do
    value { Faker::String.random }
    custom_enum_field
    building
  end
end
