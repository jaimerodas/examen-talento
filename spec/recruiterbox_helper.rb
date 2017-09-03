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
      body: { objects: [{ id: 202_268, title: 'a', description: 'a' }] }.to_json,
      headers: {}
    )

    stub_request(
      :get, 'https://api.recruiterbox.com/v2/openings/202268'
    ).with(headers: { 'Accept' => '*/*' }).to_return(
      status: 200,
      body: { id: 202_268, title: 'a', description: 'a', stages: [
        { position: 0, id: 1_947_575, name: 'Revisión candidato' },
        { position: 1, id: 1_947_576, name: 'Examen' },
        { position: 4, id: 1_947_579, name: 'Sin Tocar' },
        { position: 3, id: 1_947_582, name: 'Examen Aprobado' }
      ] }.to_json,
      headers: {}
    )

    stub_request(
      :get, 'https://api.recruiterbox.com/v2/candidates?opening_id=202268&stage_id=1947576'
    ).with(headers: { 'Accept' => '*/*' }).to_return(
      status: 200,
      body: { objects: [{
        id: 16_529_208,
        first_name: 'test',
        last_name: 'test',
        email: 'test@example.com',
        phone: '1234567890',
        description: 'test'
      }] }.to_json,
      headers: {}
    )

    stub_request(
      :get, 'https://api.recruiterbox.com/v2/candidates/16529208'
    ).with(headers: { 'Accept' => '*/*' }).to_return(
      status: 200,
      body: {
        id: 16_529_208,
        first_name: 'test',
        last_name: 'test',
        email: 'test@example.com',
        phone: '1234567890',
        description: 'test',
        state: 'test'
      }.to_json,
      headers: {}
    )

    stub_request(
      :patch, 'https://api.recruiterbox.com/v2/candidates/16529208'
    ).with(body: { stage_id: 1_947_582, profile_data: [
      { name: 'Calificación Examen', value: '95' }
    ] }.to_json).to_return(
      status: 200,
      body: {
        id: 16_529_208,
        first_name: 'test',
        last_name: 'test',
        email: 'test@example.com',
        phone: '1234567890',
        description: 'test',
        stage_id: 1_947_582,
        profile_data: [{ name: 'Calificación Examen', value: '95' }]
      }.to_json,
      headers: {}
    )
  end
end
