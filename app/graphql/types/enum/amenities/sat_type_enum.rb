# frozen_string_literal: true

module Types
  module Enum
    module Amenities
      class SatTypeEnum < Types::BaseEnum
        Amenity.sat_types.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
