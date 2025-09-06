require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'name' do
    it { is_expected.to have_attribute(:name) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_index(:name).unique }
  end

  describe 'validations' do
    subject { FactoryBot.build(:client) }

    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:buildings) }
    it { is_expected.to have_many(:custom_fields) }
  end
end
