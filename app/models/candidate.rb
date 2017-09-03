# frozen_string_literal: true

# A candidate applying for an opening
class Candidate < ApplicationRecord
  belongs_to :opening, optional: true

  validates_presence_of :email, :service_id, :first_name, :last_name
  validates_uniqueness_of :email, :service_id

  def full_name
    "#{first_name} #{last_name}"
  end
end
