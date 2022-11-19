# frozen_string_literal: true

module Properties
  class PropertyCreator < BaseService
    def call
      Property.create!(params)
    end
  end
end
