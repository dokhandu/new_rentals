# frozen_string_literal: true

module Attributes
  module Tenants
    class TenantAttributes < Types::BaseInputObject
      argument :id, ID, required: false
      argument :user_id, ID, required: false
      argument :property_id, ID, required: false
      argument :unit_id, ID, required: false
      argument :application_title, String, required: false
      argument :application_detail, String, required: false
      argument :cid, String, required: false
      argument :current_employer, String, required: false
      argument :family_composition, String, required: false
      argument :pets, Boolean, required: false
      argument :state, Types::Enum::Tenants::StateEnum, required: false, description: 'Not Needed during first Creation Process'
      argument :moved_in_date, GraphQL::Types::ISO8601Date, required: false
      argument :prefer_move_in_date, GraphQL::Types::ISO8601Date, required: false
    end
  end
end
