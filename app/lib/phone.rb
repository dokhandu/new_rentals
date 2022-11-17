# frozen_string_literal: true

class Phone
  attr_accessor :phone

  def initialize(number, parser: TelephoneNumber)
    number = number.to_s.gsub(/^00/, '+')

    arguments = number.start_with?('+') ? [number] : [number, :ch]
    @phone = parser.parse(*arguments)
  end

  delegate :valid?, to: :phone

  def format
    number = phone.international_number
    number.present? ? number.gsub(/[()\-A-Z]/, '') : nil
  end

  def country_code
    phone.country.try(:country_id)
  end
end

