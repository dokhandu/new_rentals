# frozen_string_literal: true

module Queries
  class Users < Queries::BaseQuery
    argument :params, Attributes::Users::UserFilterAttributes, required: false
    type [Types::Users::UserType], null: false

    def resolve(params: {})
      ::Resolver::UsersResolver.new(current_user:, params: params.to_h).call
    end
  end
end
