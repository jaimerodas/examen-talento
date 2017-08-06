# frozen_string_literal: true

# This is the class that is inherited by all models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
