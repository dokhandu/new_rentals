# frozen_string_literal: true

module Resolver
  class PropertiesResolver < BaseResolver
    attr_accessor :property_type, :occupancy_type, :upload_as

    def call
      paginated_properties
        .try { |properties| filter_by_type(properties) }
        .try { |properties| filter_by_occupancy(properties) }
        .try { |properties| filter_by_uploader(properties) }
        .try { |properties| search_properties(properties) }
    end

    private

    def paginated_properties
      Property.includes([:units]).limit(limit_per_page).offset(offset_page)
    end

    def filter_by_type(properties)
      return properties if property_type.blank?

      properties.where(property_type:)
    end

    def filter_by_occupancy(properties)
      return properties if occupancy_type.blank?

      properties.where(occupancy_type:)
    end

    def filter_by_uploader(properties)
      return properties if upload_as.blank?

      properties.where(upload_as:)
    end

    def search_properties(properties)
      return properties if query.blank?

      properties.where(
        "CONCAT_WS(
          ' ',
          property_name,
          lat,
          lng
         )
         iLIKE ?", "%#{query.squish}%"
      )
    end
  end
end
