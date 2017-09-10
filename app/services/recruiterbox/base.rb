# frozen_string_literal: true

module Recruiterbox
  # All of the methods that target candidates are in this class
  class Base
    require 'rest-client'
    require 'json'

    class << self
      # Returns all objects that have the specified (optional) parameters
      def where(params = {})
        response = RestClient::Request.execute(
          method: :get,
          url: url,
          user: Recruiterbox.config.api_key,
          headers: { params: params }
        )
        JSON.parse(response.body)['objects']
      end

      # Returns a single, full object
      def find(id)
        response = RestClient::Request.execute(
          method: :get,
          url: url + '/' + id.to_s,
          user: Recruiterbox.config.api_key
        )
        JSON.parse(response.body)
      end

      private

      # Returns the candidates url
      def url
        Recruiterbox.config.url
      end
    end
  end
end
