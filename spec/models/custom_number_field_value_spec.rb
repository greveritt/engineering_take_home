require 'rails_helper'

RSpec.describe CustomNumberFieldValue, type: :model do
  it { is_expected.to belong_to :custom_number_field }
  it { is_expected.to belong_to :building }
end
