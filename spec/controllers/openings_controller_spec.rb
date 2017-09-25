# frozen_string_literal: true

require 'rails_helper'

describe OpeningsController do
  let(:user) { create :user }
  before { session[:user_id] = user.id }

  describe '#index' do
    subject { get :index }
    it 'renders the template' do
      expect(subject).to render_template :index
    end
  end

  describe '#sync' do
    subject { post :sync }
    it 'redirects to openings' do
      allow(RecruiterboxSync).to receive(:call).and_return(true)
      expect(subject).to redirect_to(openings_path)
    end
  end
end
