# frozen_string_literal: true

module Queries
  class User < Queries::BaseQuery
    argument :id, ID, required: false
    type Types::Users::UserType, null: false

    def resolve(id:)
      ::User.find_by(id:)
    end
  end
end
