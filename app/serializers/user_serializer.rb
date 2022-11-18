# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes(
    :id,
    :email,
    :status,
    :enabled,
    :role_id
  )
  belongs_to :role
  has_one :subscription_plan
  has_one :portal_setting
  has_one :profile
end
