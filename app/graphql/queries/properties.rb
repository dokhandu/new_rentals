# frozen_string_literal: true

module Queries
  class Properties < Queries::BaseQuery
    class PropertiesFilterAttributes < Types::BaseInputObject
      argument :occupancy_type, Types::Enum::Properties::OccupancyTypeEnum, required: false
      argument :property_type, Types::Enum::Properties::PropertyTypeEnum, required: false
      argument :upload_as, Types::Enum::Properties::UploadAsEnum, required: false
    end

    argument :attributes, PropertiesFilterAttributes, required: false
    type [Types::Properties::PropertyType], null: false

    def resolve(attributes: {})
      ::Resolver::PropertiesResolver.new(current_user:, params: attributes.to_h).call
    end
  end
end
