# frozen_string_literal: true

# An exam to be answered by a Candidate in order to be considered for an
# opening
class ExamSectionExam < ApplicationRecord
  belongs_to :exam
  belongs_to :exam_section
end
