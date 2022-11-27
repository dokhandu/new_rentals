# frozen_string_literal: true

module Types
  module Properties
    class PropertyType < BaseObject
      field :id, ID, null: false
      field :owner, Types::Users::UserType, null: true
      field :property_type, String, null: true
      field :occupancy_type, String, null: true
      field :upload_as, String, null: false
      field :property_name, String, null: true
      field :lat, String, null: true
      field :lng, String, null: true
      field :property_description, String, null: true
      field :neighbourhood_details, String, null: true
      field :all_occupied, String, null: false
      field :attachments, [Types::Attachments::AttachmentType], null: true
      field :units_count, Integer, null: true
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

        def all_occupied
          return 'No Units Available' if object.units.blank?

          object.units.all?(occupied: true).to_s
        end
      end
    end
  end
end
