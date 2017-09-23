# frozen_string_literal: true

require 'rails_helper'

describe EssayQuestion, type: :model do
  describe 'validations' do
    subject { create :essay_question }

    # Presence
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_absence_of(:answers) }
  end
end
