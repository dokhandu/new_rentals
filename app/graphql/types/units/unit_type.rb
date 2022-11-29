# frozen_string_literal: true

module Types
  module Units
    class UnitType < BaseObject
      field :id, ID, null: false
      field :property_id, ID, null: false
      field :property, Types::Properties::PropertyType, null: false
      field :monthly_rent, Integer, null: false
      field :occupied, Boolean, null: false
      field :unit_number, String, null: true
      field :nos_of_bed, Integer, null: true
      field :nos_of_bath, Integer, null: true
      field :nos_of_applicants, Integer, null: true
      field :unit_description, String, null: false
      field :attachments, [Types::Attachments::AttachmentType], null: false
      field :normal_amenities, [Types::Amenities::AmenityType], null: false
      field :current_user_tenant, [Types::Tenants::TenantType], null: true

      def current_user_tenant
        Tenant.where(user_id: current_user.id, unit_id: object.id)
      end
    end
  end
end
