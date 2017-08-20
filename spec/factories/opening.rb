# frozen_string_literal: true

FactoryGirl.define do
  factory :opening do
    name 'Vacante de Prueba'
    sequence :service_id
    test_stage_id 1234
    passed_stage_id 1235
  end
end
