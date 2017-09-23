# frozen_string_literal: true

# How you log into the system
class LoginsController < ApplicationController
  layout 'session'

  def show
    redirect_to root_path if current_user
  end

  def create
    login(request.env['omniauth.auth'])
    redirect_to root_path
  end
end
