FactoryBot.define do
  factory :custom_enum_field do
    name { Faker::String.random }
    client
  end
end
