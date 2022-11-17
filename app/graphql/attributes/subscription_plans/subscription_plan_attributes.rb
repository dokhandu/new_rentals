# frozen_string_literal: true

module Attributes
  module SubscriptionPlans
    class SubscriptionPlanAttributes < Types::BaseInputObject
      argument :id, ID, required: false
      argument :name, Types::Enum::SubscriptionPlans::NameEnum, required: false
      argument :_destroy, Integer, required: false
    end
  end
end
