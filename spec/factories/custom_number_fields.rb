FactoryBot.define do
  factory :custom_number_field do
    name { Faker::Quote.matz }
    client
  end
end
