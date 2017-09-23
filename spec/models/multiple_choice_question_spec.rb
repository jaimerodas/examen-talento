# frozen_string_literal: true

require 'rails_helper'

describe MultipleChoiceQuestion, type: :model do
  describe 'validations' do
    subject { create :multiple_choice_question }

    # Presence
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:answers) }
  end
end
