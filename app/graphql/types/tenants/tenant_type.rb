# frozen_string_literal: true

module Types
  module Tenants
    class TenantType < BaseObject
      field :id, ID, null: false
      field :user_id, ID, null: false
      field :property_id, ID, null: false
      field :unit_id, ID, null: false
      field :application_title, String, null: true
      field :application_detail, String, null: true
      field :cid, String, null: false
      field :current_employer, String, null: true
      field :family_composition, String, null: true
      field :pets, Boolean, null: true
      field :state, String, null: false
      field :moved_in_date, GraphQL::Types::ISO8601Date, null: true
      field :prefer_move_in_date, GraphQL::Types::ISO8601Date, null: true
      field :user, Types::Users::UserType, null: false
      field :property, Types::Properties::PropertyType, null: false
      field :unit, Types::Units::UnitType, null: false
    end
  end
end
