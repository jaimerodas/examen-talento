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

  describe '#name' do
    it 'returns the full name' do
      expect(user.name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
