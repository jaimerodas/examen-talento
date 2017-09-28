# frozen_string_literal: true

# The initial page you see when you're logged in
class ExamsController < ApplicationController
  before_action :logged_in_user?

  def index
    @exams = Exam.all.page(params[:page])
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      redirect_to exams_path
    else
      render :new
    end
  end

  private

  def exam_params
    params.require(:exam).permit(:title, :passing_grade)
  end
end
