# frozen_string_literal: true

module Queries
  class Tenant < Queries::BaseQuery
    argument :id, ID, required: false
    type Types::Tenants::TenantType, null: false

    def resolve(id:)
      ::Tenant.find_by(id:)
    end
  end
end
