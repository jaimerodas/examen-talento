# frozen_string_literal: true

# An opening in the company
class Opening < ApplicationRecord
  belongs_to :exam, optional: true
  has_many :candidates, dependent: :nullify

  validates_presence_of :name, :service_id, :test_stage_id, :passed_stage_id
  validates_uniqueness_of :service_id

  def self.active
    where(locked: false)
  end
end
