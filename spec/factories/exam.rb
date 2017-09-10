# frozen_string_literal: true

FactoryGirl.define do
  factory :exam do
    title 'Test Exam'
    passing_grade 70

    trait :locked { locked true }

    factory :locked_exam, traits: [:locked]
  end
end
