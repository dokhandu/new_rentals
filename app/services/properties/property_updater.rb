# frozen_string_literal: true

module Properties
  class PropertyUpdater < BaseService
    def call
      Property.find_by(id: params.delete('id')).tap do |property|
        property.update!(params)
      end
    end
  end
end
