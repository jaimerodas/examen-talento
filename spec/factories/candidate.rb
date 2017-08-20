# frozen_string_literal: true

FactoryGirl.define do
  factory :candidate do
    sequence :email { |n| "person#{n}@example.com" }
    first_name 'Test'
    last_name 'Person'
    sequence :service_id
    opening
  end
end
