# frozen_string_literal: true

module Queries
  class Units < Queries::BaseQuery
    class UnitFilterAttributes < Types::BaseInputObject
      argument :property_type, Types::Enum::Properties::PropertyTypeEnum, required: false
      argument :occupancy_type, Types::Enum::Properties::OccupancyTypeEnum, required: false
      argument :lat, String, required: false
      argument :lng, String, required: false
      argument :price, Integer, required: false
    end

    argument :attributes, UnitFilterAttributes, required: false
    type [Types::Units::UnitType], null: false

    def resolve(attributes: {})
      ::Resolver::UnitsResolver.new(current_user:, params: attributes.to_h).call
    end
  end
end
