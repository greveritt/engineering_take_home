require 'rails_helper'

RSpec.describe Client, type: :model do
  subject { FactoryBot.build(:client) }

  describe 'name' do
    it { is_expected.to have_attribute(:name) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_index(:name).unique }

    it { is_expected.to validate_uniqueness_of(:name) }
  end

  it { is_expected.to have_many :custom_fields }
end
