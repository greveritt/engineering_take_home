class CustomEnumFieldValue < ApplicationRecord
  belongs_to :custom_enum_field_choice
  belongs_to :building
end
