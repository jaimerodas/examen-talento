# frozen_string_literal:true

require 'webmock/rspec'
require_relative '../app/services/recruiterbox'
require 'spec_helper'

RSpec.configure do |config|
  config.before(:each) do
    stub_request(
      :get, 'https://api.recruiterbox.com/v2/openings?tags=Tiene%20Examen'
    ).with(headers: { 'Accept' => '*/*' }).to_return(
      status: 200,
      body: { objects: [{ id: 1, title: 'a', description: 'a' }] }.to_json,
      headers: {}
    )

    stub_request(
      :get, 'https://api.recruiterbox.com/v2/openings/202268'
    ).with(headers: { 'Accept' => '*/*' }).to_return(
      status: 200,
      body: { id: 202_268, title: 'a', description: 'a' }.to_json,
      headers: {}
    )
  end
end
