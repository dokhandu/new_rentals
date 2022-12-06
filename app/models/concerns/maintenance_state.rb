# frozen_string_literal: true

module MaintenanceState
  extend ActiveSupport::Concern

  included do
    aasm column: :state, enum: true, whiny_persistence: true do
      state :open, initial: true
      state :on_hold
      state :in_progress
      state :completed

      event :analyzing do
        transitions from: :open, to: :on_hold
      end

      event :working do
        transitions from: :open, to: :in_progress
      end

      event :confirming do
        transitions from: :on_hold, to: :in_progress
      end

      event :finishing do
        transitions from: :in_progress, to: :completed
      end
    end
  end
end
