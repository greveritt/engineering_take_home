class CustomEnumFieldValue < ApplicationRecord
  belongs_to :custom_enum_field_choice
  belongs_to :building

  # has_one :custom_enum_field, through: :custom_enum_field_choice
end
