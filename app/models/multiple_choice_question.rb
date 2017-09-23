# frozen_string_literal: false

# Exam question with several answers, each of which can have a different score.
class MultipleChoiceQuestion < ExamQuestion
  validates_presence_of :answers
end
