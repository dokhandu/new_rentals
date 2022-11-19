# frozen_string_literal: true

class Attachment < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :attachable, polymorphic: true

  has_one_attached :file

  enum category: { misc_files: 0, property: 2, unit: 4, avatar: 6, avatar_background: 8, logo: 10 }

  validates :category, presence: true

  validates :file,
            attached: true,
            file_size: { less_than: 50.megabytes },
            file_content_type: {
              allow: %w[
                text/csv image/jpeg image/jpg image/png application/pdf application/vnd.ms-excel application/msword
                        application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.ms-visio.viewer
                        application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.visio
                        application/vnd.ms-excel.sheet.macroenabled.12 application/vnd.oasis.opendocument.spreadsheet
              ]
            }

  def url
    rails_blob_path(file, only_path: true)
  end
end
