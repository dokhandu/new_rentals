# frozen_string_literal: true

module Mutations
  module Attachments
    class CreateAttachment < Mutations::BaseMutation
      argument :attributes, Attributes::Attachments::AttachmentAttributes, required: true
      field :file_object, Types::Attachments::AttachmentType, null: true

      def resolve(attributes: {})
        { file_object: ::Attachments::AttachmentCreator.new(current_user:, params: attributes.to_h).call }
      end
    end
  end
end
