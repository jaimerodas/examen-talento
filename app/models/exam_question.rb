# frozen_string_literal: false

# The base class for questions, should never actually be used by itself.
class ExamQuestion < ApplicationRecord
  belongs_to :exam_section

  validates_presence_of :title
end
