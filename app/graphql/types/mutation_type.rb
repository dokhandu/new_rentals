# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Users
    field :update_user, mutation: Mutations::Users::UpdateUser

    # Property
    field :create_property, mutation: Mutations::Properties::CreateProperty
    field :update_property, mutation: Mutations::Properties::UpdateProperty

    # Attachment
    field :create_attachment, mutation: ::Mutations::Attachments::CreateAttachment

    # Tenant
    field :create_tenant, mutation: ::Mutations::Tenants::CreateTenant
    field :interview_tenant, mutation: ::Mutations::Tenants::InterviewTenant
    field :accept_tenant, mutation: ::Mutations::Tenants::ApproveTenant
    field :decline_tenant, mutation: ::Mutations::Tenants::DeclineTenant

    # Maintenance
    field :create_maintenance, mutation: ::Mutations::Maintenances::CreateMaintenance
  end
end
