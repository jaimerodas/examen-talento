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

  describe '#create' do
    context 'with a correct params hash' do
      let(:exam) { attributes_for :exam }
      subject { post :create, params: { exam: exam } }
      it 'saves the exam' do
        expect { subject }.to change { Exam.all.count }.by(1)
      end

      it 'redirects to index' do
        expect(subject).to redirect_to(exams_path)
      end
    end

    context 'with an incorrect params hash' do
      let(:exam) { { title: 'Prueba' } }
      subject { post :create, params: { exam: exam } }
      it 'does not save the exam' do
        expect { subject }.not_to(change { Exam.all.count })
      end

      it 'rerenders the form' do
        expect(subject).to render_template :new
      end
    end
  end
end
