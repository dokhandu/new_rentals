# frozen_string_literal: true

module Attachments
  class AttachmentCreator < BaseService
    def call
      Attachment.new(params.merge(user: current_user)).tap(&:save!)
    end
  end
end
