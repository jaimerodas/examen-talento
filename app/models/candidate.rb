# frozen_string_literal: true

# A candidate applying for an opening
class Candidate < ApplicationRecord
  belongs_to :opening

  validates_presence_of :email, :service_id, :first_name, :last_name
  validates_uniqueness_of :email, :service_id
end
