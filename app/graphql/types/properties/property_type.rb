# frozen_string_literal: true

module Types
  module Properties
    class PropertyType < BaseObject
      field :id, ID, null: false
      field :owner, Types::Users::UserType, null: true
      field :property_type, String, null: true
      field :occupancy_type, String, null: true
      field :property_name, String, null: true
      field :lat, String, null: true
      field :lng, String, null: true
      field :property_description, String, null: true
      field :neighbourhood_details, String, null: true
      field :attachments, [Types::Attachments::AttachmentType], null: true
      field :unit_counts, Integer, null: true
      field :units, [Types::Units::UnitType], null: true
      field :special_amenities, [Types::Amenities::AmenityType], null: true
      field :normal_amenities, [Types::Amenities::AmenityType], null: true

      %i[
        attachments
        units
        special_amenities
        normal_amenities
      ].each do |association|
        define_method(association) do
          preload_association(object, association)
        end
      end

      def units_counts
        object.units.size
      end
    end
  end
end
