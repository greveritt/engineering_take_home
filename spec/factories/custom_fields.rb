FactoryBot.define do
  factory :custom_field do
    name { Faker::Movies::PrincessBride.quote }
    type { CustomField::TYPE_NAMES.sample }
    client { association(:client) }
  end
end
