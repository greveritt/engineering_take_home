class Client < ApplicationRecord
  attribute :name, type: :string

  has_many :buildings
  has_many :custom_freeform_field
  has_many :custom_number_field
  has_many :custom_enum_field

  validates :name, uniqueness: true
end
