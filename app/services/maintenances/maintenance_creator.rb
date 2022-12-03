# frozen_string_literal: true

module Maintenances
  class MaintenanceCreator < BaseService
    attr_accessor :maintenance

    def call
      raise StandardError, 'You do not belong to the given property, please check your property' unless valid_tenant

      @maintenance = Maintenance.new(params).tap(&:save)
      ::MaintenanceMailer.notify_received(maintenance.id).deliver_now
    end

    private

    def valid_tenant
      Tenant.find(params[:tenant_id]).property_id == params[:property_id].to_i
    end
  end
end
