# frozen_string_literal: true

# A user from the company, who has access to the exam data
class User < ApplicationRecord
  validates_presence_of :uid, :email, :first_name
  validates_uniqueness_of :uid

  def self.alphabetically(direction = :asc)
    order(last_name: direction, first_name: direction)
  end

  def name
    return first_name if last_name.blank?
    "#{first_name} #{last_name}"
  end
end
