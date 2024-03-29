# frozen_string_literal: true

module Resolver
  class UnitsResolver < BaseResolver
    attr_accessor :property_type, :occupancy_type, :lat, :lng, :price

    def call
      paginated_units
        .try { |units| filter_by_type(units) }
        .try { |units| filter_by_occupancy(units) }
        .try { |units| filter_by_location(units) }
        .try { |units| filter_by_price(units) }
        .try { |units| search_by_address(units) }
        .try { |units| sort_by_price(units) }
    end

    private

    def paginated_units
      ids = ::Unit.where(occupied: false).limit(limit_per_page)
                  .offset(offset_page)
                  .uniq { |unit| [unit.property_id, unit.monthly_rent] }.pluck(:id).uniq

      ::Unit.where(id: ids)
    end

    def filtered_units(ids)
      @_filtered_units ||= {}
      @_filtered_units[ids] ||= Unit.includes([:property]).where(id: ids)
    end

    def filter_by_type(units)
      return units if property_type.blank?

      filtered_units(units.pluck(:id)).joins(:property).where(property: { property_type: })
    end

    def filter_by_occupancy(units)
      return units if occupancy_type.blank?

      filtered_units(units.pluck(:id)).joins(:property).where(property: { occupancy_type: })
    end

    def filter_by_location(units)
      return units if lat.blank? && lng.blank?

      filtered_units(units.pluck(:id)).joins(:property).where(property: { lat:, lng: })
    end

    def filter_by_price(units)
      return units if price.blank?

      units.where(monthly_rent: price)
    end

    def sort_by_price(units)
      return units if sort.blank?

      units.public_send("sort_by_#{sort}", set_direction)
    end

    def search_by_address(units)
      return units if query.blank?

      units.joins(:property).where(
        "CONCAT_WS(
          ' ',
          neighbourhood_details
         )
         iLIKE ?", "%#{query.squish}%"
      )
    end
  end
end
