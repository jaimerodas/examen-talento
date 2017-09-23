# frozen_string_literal: true

require 'rails_helper'

describe SessionsHelper, type: :helper do
  let(:user) { create :user }

  describe 'current_user' do
    it 'finds the current_user if a session exists' do
      session[:user_id] = user.id
      expect(current_user).to eq(user)
    end

    it 'returns nil if a session does not exist' do
      session.delete :user_id
      expect(current_user).to be_nil
    end
  end

  describe 'login' do
    context 'when a user does not exist' do
      after(:each) { session.delete :user_id }

      let(:auth_token) do
        OpenStruct.new(
          uid: 'def1',
          info: OpenStruct.new(
            first_name: 'nuevo',
            last_name: 'usuario',
            email: 'def1@example.com'
          )
        )
      end

      it 'creates a user' do
        expect { login(auth_token) }.to(
          change { User.find_by(uid: auth_token[:uid]) }.from(nil)
        )
      end

      it 'creates a session' do
        expect { login(auth_token) }.to(
          change { session[:user_id] }.from(nil)
        )
      end
    end

    context 'when a user does exist' do
      let(:auth_token) do
        OpenStruct.new(
          uid: user.uid,
          info: OpenStruct.new(
            first_name: 'nuevos',
            last_name: 'datos',
            email: 'test_change@example.com'
          )
        )
      end

      it 'updates that user' do
        login(auth_token)
        expect(user.reload.first_name).to eq auth_token.info.first_name
      end

      it 'creates a session' do
        expect { login(auth_token) }.to(
          change { session[:user_id] }.from(nil).to(user.id)
        )
      end
    end
  end

  describe 'logout' do
    it 'deletes a session' do
      session[:user_id] = user.id
      expect { logout }.to change { session[:user_id] }.to nil
    end
  end
end
