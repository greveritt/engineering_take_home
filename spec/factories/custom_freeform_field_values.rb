FactoryBot.define do
  factory :custom_freeform_field_value do
    value { Faker::String.random }
    custom_freeform_field
    building
  end
end
