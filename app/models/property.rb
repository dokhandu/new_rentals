# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to( # rubocop:disable Rails/InverseOf
    :owner,
    -> { where(role_id: 3) },
    class_name: 'User'
  )

  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :units, dependent: :destroy
  has_many :special_amenities, as: :amenitable, dependent: :destroy
  has_many :normal_amenities, as: :amenitable, dependent: :destroy

  enum property_type: { modern_building: 0, traditional_house: 2 }
  enum occupancy_type: { single_family_home: 0, multi_family_home: 2 }

  accepts_nested_attributes_for(
    :attachments,
    :units,
    :special_amenities,
    :normal_amenities,
    allow_destroy: true
  )
end
