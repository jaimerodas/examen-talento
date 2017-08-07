# frozen_string_literal: true
require_relative 'recruiterbox/openings'
# Module for interacting with the Recruiterbox API
module Recruiterbox
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Config.new
    yield(config)
  end

  # Main config options
  class Config
    attr_accessor :api_key, :url

    def initialize
      @url = 'https://api.recruiterbox.com/v2/'
    end
  end
end
