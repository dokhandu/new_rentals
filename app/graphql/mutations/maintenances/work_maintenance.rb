# frozen_string_literal: true

module Mutations
  module Maintenances
    class WorkMaintenance < Mutations::BaseMutation
      argument :id, ID, required: true
      field :status, Boolean, null: true

      def resolve(id:)
        { status: ::Maintenances::MaintenanceWorker.new(current_user:, params: { id: }).call }
      end
    end
  end
end
