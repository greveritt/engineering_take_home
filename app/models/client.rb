class Client < ApplicationRecord
  attribute :name, type: :string

  has_many :custom_fields

  validates :name, uniqueness: true
end
