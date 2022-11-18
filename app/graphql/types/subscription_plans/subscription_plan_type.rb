# frozen_string_literal: true

module Types
  module SubscriptionPlans
    class SubscriptionPlanType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
    end
  end
end
