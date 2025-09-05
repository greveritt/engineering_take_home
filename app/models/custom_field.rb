# frozen_string_literal: true

class CustomField < ApplicationRecord
  # TODO: Different table types for different field types?
  TYPE_NAMES = %w[number freeform enum]

  belongs_to :client
end
