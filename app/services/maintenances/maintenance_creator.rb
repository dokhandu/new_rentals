# frozen_string_literal: true

module Maintenances
  class MaintenanceCreator < BaseService
    def call
      raise StandardError, 'You do not belong to the given property, please check your property' unless validate_tenant

      Maintenance.new(params).tap(&:save)
    end

    private

    def validate_tenant
      Tenant.find(params[:tenant_id]).property_id == params[:property_id].to_i
    end
  end
end
