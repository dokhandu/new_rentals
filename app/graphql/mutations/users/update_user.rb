# frozen_string_literal: true

module Mutations
  module Users
    class UpdateUser < Mutations::BaseMutation
      argument :attributes, Attributes::Users::UserAttributes, required: true

      field :user, Types::Users::UserType, null: false

      def resolve(attributes:)
        { user: ::Users::UserUpdater.new(current_user:, params: attributes.to_h).call }
      end
    end
  end
end
