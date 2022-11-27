# frozen_string_literal: true

module Types
  module Enum
    module Maintenances
      class StateEnum < Types::BaseEnum
        graphql_name 'MaintenanceStateEnum'

        Maintenance.states.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
