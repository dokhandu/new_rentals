# frozen_string_literal: true

module Attributes
  module Units
    class UnitAttributes < Types::BaseInputObject
      argument :id, ID, required: false
      argument :property_id, ID, required: false
      argument :monthly_rent, Integer, required: false
      argument :occupied, Boolean, required: false
      argument :unit_number, String, required: false
      argument :nos_of_bed, String, required: false
      argument :nos_of_bath, String, required: false
      argument :unit_description, String, required: false

      argument :attachments,
               [Attributes::Attachments::AttachmentAttributes],
               as: :attachments_attributes,
               required: false

      argument :normal_amenities,
               [Attributes::Amenities::AmenityAttributes],
               as: :normal_amenities_attributes,
               required: false

      argument :_destroy, Integer, required: false
    end
  end
end
