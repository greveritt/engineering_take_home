class CustomEnumFieldChoice < ApplicationRecord
  belongs_to :custom_enum_field
  has_many :custom_enum_field_values
end
