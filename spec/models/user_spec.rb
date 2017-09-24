# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  let(:user) { create :user }

  describe 'validations' do
    subject { create :user }

    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }

    it { is_expected.to validate_uniqueness_of(:uid) }
  end

  describe '.alphabetically' do
    let(:first_user) { create :user, last_name: 'aaaaaa' }
    let(:last_user) { create :user, last_name: 'zzzzzz' }

    before { first_user && last_user }

    it 'orders users by last name' do
      expect(described_class.alphabetically.first).to eq(first_user)
      expect(described_class.alphabetically.last).to eq(last_user)
    end

    it 'can sort them in reverse' do
      expect(described_class.alphabetically(:desc).first).to eq(last_user)
      expect(described_class.alphabetically(:desc).last).to eq(first_user)
    end
  end

  describe '#name' do
    it 'returns the full name' do
      expect(user.name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
