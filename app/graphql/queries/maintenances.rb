# frozen_string_literal: true

module Queries
  class Maintenances < Queries::BaseQuery
    class MaintenanceFilterAttributes < Types::BaseInputObject
      argument :property_id, ID, required: false
      argument :tenant_id, ID, required: false
    end

    argument :attributes, MaintenanceFilterAttributes, required: false
    type [Types::Maintenances::MaintenanceType], null: false

    def resolve(attributes: {})
      ::Resolver::MaintenanceResolver.new(current_user:, params: attributes.to_h).call
    end
  end
end
