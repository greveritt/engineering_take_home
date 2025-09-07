require 'rails_helper'

RSpec.describe CustomFreeformFieldValue, type: :model do
  it { is_expected.to belong_to :custom_freeform_field }
  it { is_expected.to belong_to :building }
end
