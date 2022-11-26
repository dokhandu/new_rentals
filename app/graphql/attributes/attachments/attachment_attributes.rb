# frozen_string_literal: true

module Attributes
  module Attachments
    class AttachmentAttributes < Types::BaseInputObject
      argument :id, ID, required: false
      argument :file_file_name, String, required: true
      argument :category, Types::Enum::Attachments::CategoryEnum, required: true
      argument :attachable_type, String, required: false
      argument :attachable_id, Int, required: false
      argument :user_id, ID, required: false
      argument :file, Types::CustomTypes::FileType, required: true
      argument :_destroy, Integer, required: false
    end
  end
end
