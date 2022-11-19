# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Users
    field :update_user, mutation: Mutations::Users::UpdateUser

    # Property
    field :create_property, mutation: Mutations::Properties::CreateProperty

    # Attachment
    field :create_attachment, mutation: ::Mutations::Attachments::CreateAttachment
  end
end
