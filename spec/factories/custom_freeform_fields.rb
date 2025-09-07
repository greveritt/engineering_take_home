FactoryBot.define do
  factory :custom_freeform_field do
    name { Faker::Quote.famous_last_words }
    client
  end
end
