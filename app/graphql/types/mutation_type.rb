# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Users
    field :update_user, mutation: Mutations::Users::UpdateUser

  end
end
