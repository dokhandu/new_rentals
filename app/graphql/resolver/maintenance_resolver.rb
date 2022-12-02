# frozen_string_literal: true

module Resolver
  class MaintenanceResolver < BaseResolver
    attr_accessor :tenant_id, :property_id

    def call
      paginate_maintenance
        .try { |maintenances| filter_by_tenant_id(maintenances) }
        .try { |maintenances| filter_by_property_id(maintenances) }
    end

    private

    def paginate_maintenance
      Property.all.limit(limit_per_page).offset(offset_page)
    end

    def filter_by_tenant_id(maintenances)
      return maintenances if tenant_id.blank?

      maintenances.where(tenant_id:)
    end

    def filter_by_property_id(maintenances)
      return maintenances if property_id.blank?

      maintenances.where(property_id:)
    end
  end
end
