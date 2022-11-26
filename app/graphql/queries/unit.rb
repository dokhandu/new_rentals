# frozen_string_literal: true

module Queries
  class Unit < Queries::BaseQuery
    argument :id, ID, required: false
    type Types::Units::UnitType, null: false

    def resolve(id:)
      ::Unit.find_by(id:)
    end
  end
end
