class CustomEnumField < ApplicationRecord
  # TODO: Column w/ array of valid values
  belongs_to :client

  has_many :custom_enum_field_choices
  has_many :custom_enum_field_values, through: :custom_enum_field_choices

  # # alias_attribute :choices, :custom_enum_field_choices
  # # alias_attribute :selected_values, :custom_enum_field_values
end
