# frozen_string_literal: true

# An exam to be answered by a Candidate in order to be considered for an
# opening
class ExamSection < ApplicationRecord
  has_many :exams, through: :exam_section_exam

  validates_presence_of :title, :type
end
