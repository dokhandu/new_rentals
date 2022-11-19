# frozen_string_literal: true

module Attributes
  module Amenities
    class AmenityAttributes < Types::BaseInputObject
      argument :id, ID, required: false
      argument :amenitable_type, String, required: false
      argument :amenitable_id, ID, required: false
      argument :type, String, required: false
      argument :sat_type, Types::Enum::Amenities::SatTypeEnum, required: false

      argument :sat_details, String,
               required: false,
               description: 'usually the numbers, ex: if sat_type is swimming pool, sat_details will be 2'

      argument :at_type, String,
               required: false,
               description: 'Amenities Types are usually vast, so making it enum does not makes sense '

      argument :at_details, String, required: false

      argument :_destroy, Integer, required: false
    end
  end
end
