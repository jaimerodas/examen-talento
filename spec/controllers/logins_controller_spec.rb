# frozen_string_literal: true

require 'rails_helper'

describe LoginsController, '#show' do
  subject { get :show }
  after { session.delete :user_id }
  let(:user) { create :user }

  context 'logged in' do
    before { session[:user_id] = user.id }

    it 'redirects to dashboard' do
      expect(subject).to redirect_to(root_path)
    end
  end

  context 'not logged in' do
    it 'renders the template' do
      expect(subject).to render_template :show
    end
  end
end

describe LoginsController, '#create' do
  subject { get :create, params: { provider: 'google' } }
  let(:auth) do
    OpenStruct.new(
      uid: 'aaaa',
      info: OpenStruct.new(
        first_name: 'nuevo',
        last_name: 'usuario',
        email: 'aaaa@example.com'
      )
    )
  end

  it 'creates a session' do
    request.env['omniauth.auth'] = auth

    expect { subject }.to(
      change { session[:user_id] }.from(nil)
    )
  end

  it 'redirects to dashboard' do
    request.env['omniauth.auth'] = auth

    expect(subject).to redirect_to(root_path)
  end
end
