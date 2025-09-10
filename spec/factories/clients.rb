FactoryBot.define do
  factory :client do
    name { Faker::Company.name }
    # custom_enum_fields { [ association(:custom_enum_field) ] }
    # custom_number_fields { [ association(:custom_number_field) ] }
    # custom_freeform_fields { [ association(:custom_freeform_field) ] }
  end
end
