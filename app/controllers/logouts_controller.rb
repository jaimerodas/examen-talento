# frozen_string_literal: true

# This is what we use to delete sessions
class LogoutsController < ApplicationController
  def show
    logout
    redirect_to login_path
  end
end
