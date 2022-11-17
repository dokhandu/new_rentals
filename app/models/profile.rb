# frozen_string_literal: true

class Profile < ApplicationRecord
  include Phoneable

  belongs_to :user, inverse_of: :profile
  enum gender: { male: 0, female: 1, unknown: 2 }
  enum salutation: { Mr: 0, Mrs: 1 }

  validates :phone, telephone_number: { country: proc { |record| country_code(record.phone) } }, allow_blank: true
end
