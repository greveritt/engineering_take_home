class Client < ApplicationRecord
  attribute :name, type: :string

  has_many :buildings
  has_many :custom_freeform_fields
  has_many :custom_number_fields
  has_many :custom_enum_fields

  validates :name, uniqueness: true
end
