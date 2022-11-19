# frozen_string_literal: true

module Types
  module Attachments
    class AttachmentType < BaseObject
      field :id, ID, null: false
      field :attachable_id, ID, null: false
      field :attachable_type, String, null: false
      field :user_id, ID, null: true
      field :user, Types::Users::UserType, null: true
      field :file_name, String, null: true
      field :file_content_type, String, null: false
      field :file_size, Integer, null: false
      field :category, String, null: false
      field :url, String, null: false

      def url
        rails_blob_path(object.file, only_path: true)
      end

      def file_name
        object.file_file_name
      end

      def file_size
        object.file.blob.byte_size
      end

      def file_content_type
        object.file.blob.content_type
      end

      def user
        preload_association(object, :user)
      end
    end
  end
end
