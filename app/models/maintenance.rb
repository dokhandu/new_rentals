# frozen_string_literal: true

class Maintenance < ApplicationRecord
  include AASM
  include MaintenanceState

  belongs_to :tenant
  belongs_to :property

  enum state: { open: 0, on_hold: 2, in_progress: 4, completed: 6 }
  enum request_type: { planned: 0, immediate: 2 }
  enum priority: { low: 0, medium: 2, high: 4 }
end
