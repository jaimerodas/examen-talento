# frozen_string_literal: true

# The initial page you see when you're logged in
class DashboardController < ApplicationController
  before_action :logged_in_user?

  def show; end
end
