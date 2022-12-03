# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  before_action :set_logo
  after_action :set_multipart_headers

  default from: ENV.fetch('GMAIL_USERNAME', nil)
  layout 'mailer'



  def set_logo
    attachments.inline['logo.svg'] = Rails.root.join('app/assets/logo.svg').read
  end

  def set_multipart_headers # rubocop:disable Metrics/AbcSize
    return if message.attachments.blank?

    message.content_type = 'multipart/mixed'
    message.header['Content-Type'].parameters[:boundary] = message.body.boundary
    message.content_disposition = nil
  end
end
