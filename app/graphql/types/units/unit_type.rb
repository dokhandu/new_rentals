# frozen_string_literal: true

module Types
  module Units
    class UnitType < BaseObject
      field :id, ID, null: false
      field :property_id, ID, null: false
      field :property, Types::Properties::PropertyType, null: false
      field :monthly_rent, Integer, null: false
      field :occupied, Boolean, null: false
      field :unit_number, String, null: false
      field :nos_of_bed, Boolean, null: false
      field :nos_of_bath, Boolean, null: false
      field :unit_description, Boolean, null: false
      field :attachments, [Types::Attachments::AttachmentType], null: false
      field :normal_amenities, [Types::Amenities::AmenityType], null: false
    end
  end
end
