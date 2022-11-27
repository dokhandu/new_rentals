# frozen_string_literal: true

module Attributes
  module Maintenances
    class MaintenanceAttributes < Types::BaseInputObject
      argument :id, ID, required: false
      argument :property_id, ID, required: false
      argument :tenant_id, ID, required: false
      argument :request_title, String, required: true
      argument :request_type, Types::Enum::Maintenances::RequestTypeEnum, required: false
      argument :priority, Types::Enum::Maintenances::PriorityEnum, required: false
      argument :state, Types::Enum::Maintenances::StateEnum, required: false
      argument :descriptions, String, required: false
      argument :request_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :_destroy, Integer, required: false
    end
  end
end
