# frozen_string_literal: true

require 'rails_helper'

describe Candidate, type: :model do
  describe 'validations' do
    before(:all) { create(:candidate) }
    after(:all) { Candidate.all.destroy_all }

    # Presence
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:service_id) }

    # Uniqueness
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_uniqueness_of(:service_id) }
  end
end
