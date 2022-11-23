# frozen_string_literal: true

module TenantState
  extend ActiveSupport::Concern

  included do
    aasm column: :state, enum: true, whiny_persistence: true do
      state :received, initial: true
      state :interviewing, initial: true
      state :accepted, initial: true
      state :declined

      event :processing do
        transitions from: :received, to: :interviewing
      end

      event :approving do
        transitions from: :interviewing, to: :accepted
      end

      event :rejecting do
        transitions from: :received, to: :declined
        transitions from: :interviewing, to: :declined
      end
    end
  end
end
