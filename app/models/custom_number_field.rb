class CustomNumberField < ApplicationRecord
  belongs_to :client

  has_many :custom_freeform_field_values

  alias_attribute :values, :custom_freeform_field_values
end
