# frozen_string_literal: true

# This is the class that is inherited by all other mailers
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
