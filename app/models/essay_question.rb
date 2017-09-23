# frozen_string_literal: false

# Exam question that has a long text as an answer. Can't be graded.
class EssayQuestion < ExamQuestion
  validates_absence_of :answers
end
