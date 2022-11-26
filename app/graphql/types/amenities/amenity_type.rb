# frozen_string_literal: true

module Types
  module Amenities
    class AmenityType < BaseObject
      field :id, ID, null: false
      field :amenitable_type, String, null: false
      field :amenitable_id, ID, null: false
      field :sat_type, String, null: true
      field :sat_details, String, null: true
      field :at_type, String, null: true
      field :at_details, String, null: true
    end
  end
end
