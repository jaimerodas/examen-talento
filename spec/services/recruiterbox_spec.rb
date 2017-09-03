# frozen_string_literal: true

require 'recruiterbox_helper'

describe Recruiterbox do
  it 'should set the configuration variables' do
    described_class.configure do |config|
      config.api_key = 'TEST_API_KEY'
    end

    expect(described_class.config.api_key).to eq('TEST_API_KEY')
    expect(described_class.config.url).to eq('https://api.recruiterbox.com/v2')
  end
end
