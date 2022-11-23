# frozen_string_literal: true

class Tenant < ApplicationRecord
  include AASM
  include TenantState

  belongs_to :property
  belongs_to :unit
  belongs_to :user

  enum state: { received: 0, interviewing: 5, accepted: 10, declined: 15 }
end
