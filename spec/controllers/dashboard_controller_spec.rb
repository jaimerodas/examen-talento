# frozen_string_literal: true

require 'rails_helper'

describe DashboardController, '#show' do
  after { session.delete :user_id }
  subject { get :show }
  let(:user) { create :user }

  context 'with a valid session' do
    before { session[:user_id] = user.id }
    it 'should render the template' do
      expect(subject).to render_template :show
    end
  end

  context 'without a valid session' do
    before { session.delete :user_id }

    it 'should redirect to login' do
      expect(subject).to redirect_to(login_path)
    end
  end
end
