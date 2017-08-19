# frozen_string_literal: true

module Recruiterbox
  # All of the methods that target candidates are in this class
  class Candidates
    require 'rest-client'
    require 'json'

    class << self
      # Returns all candidates that have the specified (optional) parameters
      def where(params = {})
        response = RestClient::Request.execute(
          method: :get,
          url: url,
          user: Recruiterbox.config.api_key,
          headers: { params: params }
        )
        JSON.parse(response.body)['objects']
      end

      # Returns a single, full candidate
      def find(id)
        response = RestClient::Request.execute(
          method: :get,
          url: url + '/' + id.to_s,
          user: Recruiterbox.config.api_key
        )
        JSON.parse(response.body)
      end

      # Updates data of a single candidate
      def update(id, params = {})
        response = RestClient::Request.execute(
          method: :patch,
          url: url + '/' + id.to_s,
          user: Recruiterbox.config.api_key,
          payload: params.to_json,
          headers: { content_type: :json, accept: :json }
        )
        JSON.parse(response.body)
      end

      private

      # Returns the candidates url
      def url
        Recruiterbox.config.url + 'candidates'
      end
    end
  end
end
