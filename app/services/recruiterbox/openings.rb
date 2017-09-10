# frozen_string_literal: true

module Recruiterbox
  # All of the methods that target openings are in this class
  class Openings < Base
    require 'rest-client'
    require 'json'

    class << self
      private

      # Returns the openings url
      def url
        super + '/openings'
      end
    end
  end
end
