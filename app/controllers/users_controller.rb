# frozen_string_literal: true

# The initial page you see when you're logged in
class UsersController < ApplicationController
  before_action :logged_in_user?

  def index; end
end
