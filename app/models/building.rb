class Building < ApplicationRecord
  belongs_to :client
  has_many :custom_freeform_field_values
  has_many :custom_number_field_values
  has_many :custom_enum_field_values

  has_many :custom_freeform_fields, through: :client
  has_many :custom_number_fields, through: :client
  has_many :custom_enum_fields, through: :client
end
