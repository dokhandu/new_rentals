# frozen_string_literal: true

module Phoneable
  extend ActiveSupport::Concern

  included do
    before_validation :format_phone
  end

  def format_phone
    assign_attributes(phone: Phone.new(phone).format)
  end

  class_methods do
    def country_code(number)
      Phone.new(number).country_code || :ch
    end
  end
end
