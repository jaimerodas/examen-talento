# frozen_string_literal: true

FactoryGirl.define do
  factory :multiple_choice_question do
    title 'this is a multiple choice question'
    answers [
      { order: 1, title: 'this is answer a', value: 1 },
      { order: 2, title: 'this is answer b', value: 0 },
      { order: 3, title: 'this is answer c', value: 0 }
    ].to_json
    exam_section
  end

  factory :essay_question do
    title 'this is an essay question'
    exam_section
  end
end
