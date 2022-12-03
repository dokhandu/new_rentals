# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  before_action :set_logo
  default from: ENV.fetch('GMAIL_USERNAME', nil)
  layout 'mailer'



  def set_logo
    attachments.inline['logo.svg'] = Rails.root.join('app/assets/logo.svg').read
  end
end
