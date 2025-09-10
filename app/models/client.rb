class Client < ApplicationRecord
  attribute :name, type: :string

  has_many :buildings
  has_many :custom_freeform_fields
  has_many :custom_number_fields
  has_many :custom_enum_fields

  has_many :custom_freeform_fields, through: :custom_freeform_field_values
  has_many :custom_number_fields, through: :custom_number_field_values
  has_many :custom_enum_fields, through: :custom_enum_field_values

  validates :name, uniqueness: true
end
