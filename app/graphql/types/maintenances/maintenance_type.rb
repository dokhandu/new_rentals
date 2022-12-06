# frozen_string_literal: true

module Types
  module Maintenances
    class MaintenanceType < BaseObject
      field :id, ID, null: false
      field :tenant_id, ID, null: true
      field :tenant, Types::Tenants::TenantType, null: true
      field :property_id, ID, null: true
      field :property, Types::Properties::PropertyType, null: true
      field :priority, String, null: true
      field :request_type, String, null: true
      field :request_date, GraphQL::Types::ISO8601DateTime, null: true
      field :state, String, null: true
      field :descriptions, String, null: true
      field :request_title, String, null: true

      %i[
        tenant
        property
      ].each do |association|
        define_method(association) do
          preload_association(object, association)
        end
      end
    end
  end
end
