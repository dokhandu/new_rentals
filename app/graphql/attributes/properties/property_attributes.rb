# frozen_string_literal: true

module Attributes
  module Properties
    class PropertyAttributes < Types::BaseInputObject
      argument :id, ID, required: false
      argument :owner_id, ID, required: true
      argument :property_type, Types::Enum::Properties::PropertyTypeEnum, required: false
      argument :occupancy_type, Types::Enum::Properties::OccupancyTypeEnum, required: false
      argument :property_name, String, required: true
      argument :lat, String, required: false
      argument :lng, String, required: false
      argument :property_description, String, required: false
      argument :neighbourhood_details, String, required: false

      argument :attachments,
               [Attributes::Attachments::AttachmentAttributes],
               as: :attachments_attributes,
               required: false

      argument :units,
               [Attributes::Units::UnitAttributes],
               as: :units_attributes,
               required: false

      argument :special_amenities,
               [Attributes::Amenities::AmenityAttributes],
               as: :special_amenities_attributes,
               required: false

      argument :normal_amenities,
               [Attributes::Amenities::AmenityAttributes],
               as: :normal_amenities_attributes,
               required: false

      argument :_destroy, Integer, required: false
    end
  end
end
