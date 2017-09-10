# frozen_string_literal: true

require 'rails_helper'

describe Opening, type: :model do
  describe 'validations' do
    before(:all) { create(:opening) }
    after(:all) { Opening.all.destroy_all }

    # Presence
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:service_id) }
    it { is_expected.to validate_presence_of(:test_stage_id) }
    it { is_expected.to validate_presence_of(:passed_stage_id) }

    # Uniqueness
    it { is_expected.to validate_uniqueness_of(:service_id) }
  end

  describe '.active' do
    subject { create :opening, locked: true }

    it 'returns active openings' do
      active = Opening.active
      expect(active.select(&:locked?)).to be_empty
    end
  end
end
