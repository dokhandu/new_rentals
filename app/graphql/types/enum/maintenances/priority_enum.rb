# frozen_string_literal: true

module Types
  module Enum
    module Maintenances
      class PriorityEnum < Types::BaseEnum
        Maintenance.priorities.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
