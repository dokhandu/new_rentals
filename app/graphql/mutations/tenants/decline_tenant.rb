# frozen_string_literal: true

module Mutations
  module Tenants
    class DeclineTenant < Mutations::BaseMutation
      argument :id, ID, required: true
      field :status, Boolean, null: true

      def resolve(id:)
        { status: ::Tenants::TenantDecliner.new(current_user:, params: { id: }).call }
      end
    end
  end
end
