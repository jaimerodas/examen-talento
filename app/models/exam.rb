# frozen_string_literal: true

# An exam to be answered by a Candidate in order to be considered for an
# opening
class Exam < ApplicationRecord
  has_many :openings

  validate :no_changes_if_locked, on: :update
  validates_presence_of :title, :passing_grade

  def lock!
    update(locked: true)
  end

  def unlock!
    update(locked: false)
  end

  private

  def no_changes_if_locked
    return unless locked? && changed?
    errors.add(:base, 'No se puede modificar un examen cuando está bloqueado')
  end
end
