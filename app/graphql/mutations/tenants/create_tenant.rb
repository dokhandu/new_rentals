# frozen_string_literal: true

module Mutations
  module Tenants
    class CreateTenant < Mutations::BaseMutation
      argument :attributes, Attributes::Tenants::TenantAttributes, required: true
      field :tenant, Types::Tenants::TenantType, null: true

      def resolve(attributes: {})
        { tenant: ::Tenants::TenantCreator.new(current_user:, params: attributes.to_h).call }
      end
    end
  end
end
