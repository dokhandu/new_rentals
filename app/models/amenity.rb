# frozen_string_literal: true

class Amenity < ApplicationRecord
  belongs_to :amenitable, polymorphic: true

  enum sat_type: { swimming_pool: 0, lift: 2 }
end
