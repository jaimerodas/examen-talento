# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    sequence :uid { |n| "abc#{n}" }
    first_name 'First'
    last_name 'Last'
    sequence :email { |n| "user#{n}@resuelve.mx" }
    last_sign_in_at Time.now

    factory :admin { admin true }
    factory :inactive_user { active false }
  end
end
