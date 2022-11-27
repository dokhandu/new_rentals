# frozen_string_literal: true

module Types
  module Enum
    module Maintenances
      class RequestTypeEnum < Types::BaseEnum
        Maintenance.request_types.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
