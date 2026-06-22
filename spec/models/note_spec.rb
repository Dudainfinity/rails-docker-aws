require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'validations' do
    subject { build(:note) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(2).is_at_most(140) }
  end

  it 'has a valid factory' do
    expect(build(:note)).to be_valid
  end

  describe '.published' do
    it 'returns only published notes' do
      create(:note, :published)
      create(:note)
      expect(described_class.published.count).to eq(1)
    end
  end
end
