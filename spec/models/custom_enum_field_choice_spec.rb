require 'rails_helper'

RSpec.describe CustomEnumFieldChoice, type: :model do
  it { is_expected.to belong_to :custom_enum_field }
end
