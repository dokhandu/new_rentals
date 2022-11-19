# frozen_string_literal: true

module Types
  module Amenities
    class AmenityType < BaseObject
      field :id, ID, null: false
      field :amenitable_type, String, null: false
      field :amenitable_id, ID, null: false
      field :sat_type, String, null: false
      field :sat_details, String, null: false
      field :at_type, String, null: false
      field :at_details, String, null: false
    end
  end
end
