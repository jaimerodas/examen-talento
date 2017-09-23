# frozen_string_literal: true

require 'rails_helper'

describe LogoutsController, '#show' do
  subject { get :show }
  before { session[:user_id] = create(:user).id }

  it 'deletes the session' do
    expect { subject }.to(
      change { session[:user_id] }.to(nil)
    )
  end

  it 'redirects to login' do
    expect(subject).to redirect_to(login_path)
  end
end
