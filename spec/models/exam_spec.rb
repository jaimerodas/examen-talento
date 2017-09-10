# frozen_string_literal: true

require 'rails_helper'

describe Exam, type: :model do
  let(:exam) { create :exam }
  let(:locked_exam) { create :locked_exam }

  describe 'validations' do
    subject { create :exam }

    # Presence
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:passing_grade) }

    it 'cant be modified if locked' do
      expect(locked_exam.update(title: 'prueba')).to be false
    end
  end

  describe '#lock!' do
    it 'locks an exam' do
      expect { exam.lock! }.to change { exam.locked }.from(false).to(true)
    end
  end

  describe '#unlock!' do
    it 'unlocks an exam' do
      expect { locked_exam.unlock! }.to(
        change { locked_exam.locked }.from(true).to(false)
      )
    end
  end
end
