# frozen_string_literal: true

class PortalSetting < ApplicationRecord
  belongs_to :user, inverse_of: :subscription_plan

  enum theme_colour: { pink: 0, red: 2, green: 4 }
end
