# frozen_string_literal: true

# The initial page you see when you're logged in
class OpeningsController < ApplicationController
  before_action :logged_in_user?

  def index
    @openings = Opening.all.page(params[:page])
  end

  def sync
    RecruiterboxSync.call
    redirect_to openings_path
  end
end
