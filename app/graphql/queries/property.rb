# frozen_string_literal: true

module Queries
  class Property < Queries::BaseQuery
    argument :id, ID, required: false
    type Types::Properties::PropertyType, null: false

    def resolve(id:)
      ::Property.find_by(id:)
    end
  end
end
