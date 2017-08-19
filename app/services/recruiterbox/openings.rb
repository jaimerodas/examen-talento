# frozen_string_literal: true

module Recruiterbox
  # All of the methods that target openings are in this class
  class Openings
    require 'rest-client'
    require 'json'

    class << self
      # Returns all openings that have the specified (optional) parameters
      def where(params = {})
        response = RestClient::Request.execute(
          method: :get,
          url: url,
          user: Recruiterbox.config.api_key,
          headers: { params: params }
        )
        JSON.parse(response.body)['objects']
      end

      # Returns a single, full opening
      def find(id)
        response = RestClient::Request.execute(
          method: :get,
          url: url + '/' + id.to_s,
          user: Recruiterbox.config.api_key
        )
        JSON.parse(response.body)
      end

      private

      # Returns the openings url
      def url
        Recruiterbox.config.url + 'openings'
      end
    end
  end
end
