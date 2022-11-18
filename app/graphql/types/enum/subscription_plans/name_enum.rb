# frozen_string_literal: true

module Types
  module Enum
    module SubscriptionPlans
      class NameEnum < Types::BaseEnum
        SubscriptionPlan.names.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
