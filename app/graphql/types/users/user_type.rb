# frozen_string_literal: true

module Types
  module Users
    class UserType < BaseObject
      field :id, ID, null: false
      field :email, String, null: false
      field :status, String, null: false
      field :enabled, Boolean, null: false
      field :role, Types::RoleType, null: false
      field :profile, Types::Profiles::ProfileType, null: true
      field :subscription_plan, Types::SubscriptionPlans::SubscriptionPlanType, null: true
      field :portal_setting, Types::PortalSettings::PortalSettingType, null: true

      %i[
        profile
        subscription_plan
        portal_setting
        role
      ].each do |association|
        define_method(association) do
          preload_association(object, association)
        end
      end
    end
  end
end
