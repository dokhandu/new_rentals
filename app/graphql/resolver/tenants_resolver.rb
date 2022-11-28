# frozen_string_literal: true

module Resolver
  class TenantsResolver < BaseResolver
    attr_accessor :property_id, :state

    def call
      paginated_tenants
        .try { |tenants| filter_by_property_id(tenants) }
        .try { |tenants| filter_by_state(tenants) }
    end

    private

    def paginated_tenants
      Tenant.joins(:property).where(property: { owner: current_user }).limit(limit_per_page).offset(offset_page)
    end

    def filter_by_property_id(tenants)
      return tenants if property_id.blank?

      tenants.where(property_id:)
    end

    def filter_by_state(tenants)
      return tenants if state.blank?

      tenants.where(state:)
    end
  end
end
