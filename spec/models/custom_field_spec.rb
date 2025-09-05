require 'rails_helper'

RSpec.describe CustomField, type: :model do
  it { is_expected.to belong_to :client }
end
