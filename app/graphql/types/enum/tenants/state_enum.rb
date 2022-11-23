# frozen_string_literal: true

module Types
  module Enum
    module Tenants
      class StateEnum < Types::BaseEnum
        Tenant.states.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
