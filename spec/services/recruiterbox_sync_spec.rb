# frozen_string_literal: true

require 'rails_helper'
require 'recruiterbox_helper'

describe RecruiterboxSync do
  describe '.call' do
    after(:each) do
      Opening.all.destroy_all
      Candidate.all.destroy_all
    end

    context 'when the db is empty' do
      it 'creates openings and candidates' do
        openings = Opening.count
        candidates = Candidate.count

        described_class.call

        expect(openings - Opening.count).not_to eq(0)
        expect(candidates - Candidate.count).not_to eq(0)
      end
    end

    context 'when the elements already exist' do
      it 'creates openings and candidates' do
        described_class.call
        openings = Opening.count
        candidates = Candidate.count

        described_class.call

        expect(openings - Opening.count).to eq(0)
        expect(candidates - Candidate.count).to eq(0)
      end
    end
  end
end
