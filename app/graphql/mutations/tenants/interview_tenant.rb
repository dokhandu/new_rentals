# frozen_string_literal

module Mutations
  module Tenants
    class InterviewTenant < Mutations::BaseMutation
      argument :id, ID, required: true
      field :status, Boolean, null: false

      def resolve(id:)
        { status: ::Tenants::TenantInterviewer.new(current_user:, params: { id: }).call }
      end
    end
  end
end
