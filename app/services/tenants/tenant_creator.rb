# frozen_string_literal: true

module Tenants
  class TenantCreator < BaseService
    def call

      Tenant.new(params).tap do |tenant|
        tenant.save!
        TenantMailer.notify_tenant(tenant.id).deliver_now
      end
    end
  end
end
