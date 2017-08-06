# frozen_string_literal: true

# This is the controller from which all other controllers inherit
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
