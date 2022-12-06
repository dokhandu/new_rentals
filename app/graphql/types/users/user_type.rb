# frozen_string_literal: true

module Types
  module Users
    class UserType < BaseObject
      field :id, ID, null: false
      field :email, String, null: false
      field :status, String, null: true
      field :enabled, Boolean, null: true
      field :role, Types::RoleType, null: false
      field :profile, Types::Profiles::ProfileType, null: true
      field :subscription_plan, Types::SubscriptionPlans::SubscriptionPlanType, null: true
      field :portal_setting, Types::PortalSettings::PortalSettingType, null: true
      field :profile_pic, Types::Attachments::AttachmentType, null: true
      field :property, Types::Properties::PropertyType, null: true
      field :tenant, Types::Tenants::TenantType, null: true
      field :profile_background, Types::Attachments::AttachmentType, null: true

      %i[
        profile
        subscription_plan
        portal_setting
        role
        attachments
      ].each do |association|
        define_method(association) do
          preload_association(object, association)
        end
      end

      def property
        return unless current_user.role_id == 2

        return if current_user.nil?

        ::Tenant.find_by(user_id: current_user.id).property
      end

      def tenant
        return unless current_user.role_id == 2

        return if current_user.nil?

        ::Tenant.find_by(user_id: current_user.id)
      end
    end
  end
end
