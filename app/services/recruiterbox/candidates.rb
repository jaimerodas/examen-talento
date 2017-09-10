# frozen_string_literal: true

module Recruiterbox
  # All of the methods that target candidates are in this class
  class Candidates < Base
    require 'rest-client'
    require 'json'

    class << self
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
        super + '/candidates'
      end
    end
  end
end
