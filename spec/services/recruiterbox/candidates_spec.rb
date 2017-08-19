# frozen_string_literal: true

require 'recruiterbox_helper'

describe Recruiterbox::Candidates do
  before(:all) do
    Recruiterbox.configure { |config| config.api_key = 'TEST_API_KEY' }
  end

  describe '#where' do
    let(:candidates) do
      described_class.where(opening_id: 202_268, stage_id: 1_947_576)
    end

    it 'returns an array of candidates' do
      expect(candidates).to be_an Array
      expect(candidates.sample.keys).to include(
        'id', 'first_name', 'last_name', 'email', 'phone', 'description'
      )
    end
  end

  describe '#find' do
    let(:candidate) { described_class.find(16_529_208) }

    it 'returns a single candidate' do
      expect(candidate).to be_a Hash
      expect(candidate['id']).to eq 16_529_208
      expect(candidate.keys).to include(
        'id', 'first_name', 'last_name', 'email',
        'phone', 'description', 'state'
      )
    end
  end

  describe '#update' do
    let(:profile_data) { { 'name' => 'Calificación Examen', 'value' => '95' } }
    let(:update_hash) { { stage_id: 1_947_582, profile_data: [profile_data] } }
    let(:updated_candidate) { described_class.update(16_529_208, update_hash) }

    it 'updates a candidate' do
      expect(updated_candidate).to be_a Hash
      expect(updated_candidate['stage_id']).to eq 1_947_582
      expect(updated_candidate['profile_data']).to include(profile_data)
    end
  end
end
