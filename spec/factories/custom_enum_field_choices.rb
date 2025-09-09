FactoryBot.define do
  factory :custom_enum_field_choice do
    value { Faker::Coffee.blend_name }
    custom_enum_field
  end
end
