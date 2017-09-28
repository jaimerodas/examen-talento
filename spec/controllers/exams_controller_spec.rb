# frozen_string_literal: true

require 'rails_helper'

describe ExamsController do
  let(:user) { create :user }
  before { session[:user_id] = user.id }

  describe '#index' do
    subject { get :index }
    it 'renders the template' do
      expect(subject).to render_template :index
    end
  end

  describe '#new' do
    subject { get :new }
    it 'renders the template' do
      expect(subject).to render_template :new
    end
  end
end
