require 'rails_helper'

RSpec.describe Building, type: :model do
  describe 'address' do
    it { is_expected.to have_db_column(:address1).with_options(null: false) }
    it { is_expected.to have_db_column(:address2) }
    it { is_expected.to have_db_column(:city).with_options(null: false) }
    it { is_expected.to have_db_column(:state).with_options(null: false) }
    it { is_expected.to have_db_column(:zip).with_options(null: false) }
  end

  describe 'associations' do
    subject { FactoryBot.build(:building) }

    it { is_expected.to belong_to :client }
  end
end
