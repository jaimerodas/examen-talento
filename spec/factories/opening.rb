# frozen_string_literal: true

FactoryGirl.define do
  factory :opening do
    name 'Vacante de Prueba'
    service_id 123
    test_stage_id 123
    passed_stage_id 124
  end
end
