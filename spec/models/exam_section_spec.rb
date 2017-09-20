# frozen_string_literal: true

require 'rails_helper'

describe ExamSection, type: :model do
  let(:exam_section) { create :exam_section }

  describe 'validations' do
    subject { create :exam_section }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:type) }
  end
end
