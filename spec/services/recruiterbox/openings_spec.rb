# frozen_string_literal: true

require 'recruiterbox_helper'

describe Recruiterbox::Openings do
  before(:all) do
    Recruiterbox.configure { |config| config.api_key = 'TEST_API_KEY' }
  end

  describe '#where' do
    let(:openings) { described_class.where(tags: 'Tiene Examen') }

    it 'returns an array of openings' do
      expect(openings).to be_an Array
      expect(openings.sample.keys).to include 'id', 'title', 'description'
    end
  end

  describe '#find' do
    let(:opening) { described_class.find(202_268) }

    it 'returns a single opening' do
      expect(opening).to be_a Hash
      expect(opening['id']).to eq 202_268
      expect(opening.keys).to include 'id', 'title', 'description', 'stages'
      expect(opening['stages']).to be_an Array
    end
  end
end
