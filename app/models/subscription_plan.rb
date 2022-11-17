# frozen_string_literal: true

class SubscriptionPlan < ApplicationRecord
  belongs_to :user, inverse_of: :subscription_plan

  enum name: { free_trial: 0, silver: 2, golden: 4 }
end
