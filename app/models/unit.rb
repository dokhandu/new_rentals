# frozen_string_literal: true

class Unit < ApplicationRecord
  belongs_to :property

  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :normal_amenities, as: :amenitable, dependent: :destroy

  scope :sort_by_price, ->(dir) { order(monthly_rent: dir) }

  accepts_nested_attributes_for(
    :normal_amenities,
    :attachments,
    allow_destroy: true
  )
end
