# frozen_string_literal: true

FactoryGirl.define do
  factory :opening do
    name 'Vacante de Prueba'
    sequence :service_id
    sequence :test_stage_id
    sequence :passed_stage_id
  end
end
