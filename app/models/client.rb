class Client < ApplicationRecord
  attribute :name, type: :string

  has_many :custom_fields
  has_many :buildings

  validates :name, uniqueness: true
end
