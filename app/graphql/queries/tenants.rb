# frozen_string_literal: true

module Queries
  class Tenants < Queries::BaseQuery
    class TenantFilterAttributes < Types::BaseInputObject
      argument :property_id, ID, required: false
      argument :state, Types::Enum::Tenants::StateEnum, required: false
    end

    argument :attributes, TenantFilterAttributes, required: false
    type [Types::Tenants::TenantType], null: false

    def resolve(attributes: {})
      ::Resolver::TenantsResolver.new(current_user:, params: attributes.to_h).call
    end
  end
end
