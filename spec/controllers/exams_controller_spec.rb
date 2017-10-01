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

    it 'assigns @exams' do
      subject
      expect(assigns(:exams)).to be_an(ActiveRecord::Relation)
    end
  end

  describe '#new' do
    subject { get :new }
    it 'renders the template' do
      expect(subject).to render_template :new
    end

    it 'assigns @exam' do
      subject
      expect(assigns(:exam)).to be_a_new(Exam)
    end
  end

  describe '#create' do
    context 'with a correct params hash' do
      subject { post :create, params: { exam: attributes_for(:exam) } }
      it 'saves the exam' do
        expect { subject }.to change { Exam.all.count }.by(1)
      end

      it 'redirects to index' do
        expect(subject).to redirect_to(exam_path(assigns(:exam)))
      end
    end

    context 'with an incorrect params hash' do
      subject { post :create, params: { exam: { title: 'Prueba' } } }
      it 'does not save the exam' do
        expect { subject }.not_to(change { Exam.all.count })
      end

      it 'rerenders the form' do
        expect(subject).to render_template :new
      end
    end
  end

  describe '#show' do
    let(:exam) { create :exam }
    subject { get :show, params: { id: exam.id } }

    it 'renders the template' do
      expect(subject).to render_template :show
    end

    it 'assigns @exam' do
      subject
      expect(assigns(:exam)).to eq(exam)
    end
  end
end
