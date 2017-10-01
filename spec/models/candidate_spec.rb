# frozen_string_literal: true

require 'rails_helper'

describe Candidate, type: :model do
  let(:candidate) { create(:candidate) }

  describe 'validations' do
    before(:all) { create(:candidate) }
    after(:all) { Candidate.all.destroy_all }

    # Presence
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:service_id) }

    # Uniqueness
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_uniqueness_of(:service_id) }
  end

  describe '#full_name' do
    it 'returns the full name of a person' do
      expect(candidate.full_name).to eq(
        "#{candidate.first_name} #{candidate.last_name}"
      )
    end
  end
end
