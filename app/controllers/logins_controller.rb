# frozen_string_literal: true

# How you log into the system
class LoginsController < ApplicationController
  def show
    redirect_to root_path if current_user
  end

  def create
    login(request.env['omniauth.auth'])
    redirect_to root_path
  end
end
