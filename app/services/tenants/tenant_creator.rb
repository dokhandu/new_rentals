# frozen_string_literal: true

module Tenants
  class TenantCreator < BaseService
    def call
      Tenant.new(params.merge(state: :received)).tap(&:save!)
    end
  end
end
