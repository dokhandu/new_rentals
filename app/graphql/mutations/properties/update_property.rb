# frozen_string_literal: true

module Mutations
  module Properties
    class UpdateProperty < Mutations::BaseMutation
      argument :attributes, Attributes::Properties::PropertyAttributes, required: true
      field :property, Types::Properties::PropertyType, null: false

      def resolve(attributes: {})
        { property: ::Properties::PropertyUpdater.new(current_user:, params: attributes.to_h).call }
      end
    end
  end
end
