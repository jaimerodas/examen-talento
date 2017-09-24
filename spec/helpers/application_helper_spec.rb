# frozen_string_literal: true

require 'rails_helper'

describe ApplicationHelper do
  describe '#timed_greeting' do
    it 'says go to sleep' do
      allow(Time).to receive(:now).and_return(OpenStruct.new(hour: 1))
      expect(timed_greeting).to eq('Ya vete a dormir')
    end

    it 'says good early morning' do
      allow(Time).to receive(:now).and_return(OpenStruct.new(hour: 5))
      expect(timed_greeting).to eq('Buenas madrugadas')
    end

    it 'says good morning' do
      allow(Time).to receive(:now).and_return(OpenStruct.new(hour: 9))
      expect(timed_greeting).to eq('Buenos días')
    end

    it 'says good afternoon' do
      allow(Time).to receive(:now).and_return(OpenStruct.new(hour: 15))
      expect(timed_greeting).to eq('Buenas tardes')
    end

    it 'says good night' do
      allow(Time).to receive(:now).and_return(OpenStruct.new(hour: 21))
      expect(timed_greeting).to eq('Buenas noches')
    end
  end
end
