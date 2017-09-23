# frozen_string_literal: true

# This is the controller from which all other controllers inherit
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def logged_in_user?
    redirect_to login_path unless current_user
  end
end
