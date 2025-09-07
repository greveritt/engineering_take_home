require 'rails_helper'

RSpec.describe CustomEnumFieldValue, type: :model do
  it { is_expected.to belong_to :custom_enum_field }
  it { is_expected.to belong_to :building }
end
