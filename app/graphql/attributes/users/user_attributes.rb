# frozen_string_literal: true

module Attributes
  module Users
    class UserAttributes < Types::BaseInputObject
      argument :id, ID, required: false
      argument :role_id, ID, required: false
      argument :enabled, Boolean, required: false
      argument :status, Types::Enum::Users::StatusEnum, required: false

      argument :profile,
               Attributes::Profiles::ProfileAttributes,
               as: :profile_attributes,
               required: false

      argument :subscription_plan,
               Attributes::SubscriptionPlans::SubscriptionPlanAttributes,
               as: :subscription_plan_attributes,
               required: false

      argument :portal_setting,
               Attributes::PortalSettings::PortalSettingAttributes,
               as: :portal_setting_attributes,
               required: false

      argument :_destroy, Integer, required: false
    end
  end
end
