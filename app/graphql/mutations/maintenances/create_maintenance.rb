# frozen_string_literal: true

module Mutations
  module Maintenances
    class CreateMaintenance < Mutations::BaseMutation
      argument :attributes, Attributes::Maintenances::MaintenanceAttributes, required: true
      field :maintenance, Types::Maintenances::MaintenanceType, null: true

      def resolve(attributes: {})
        { maintenance: ::Maintenances::MaintenanceCreator.new(current_user:, params: attributes.to_h).call }
      end
    end
  end
end
