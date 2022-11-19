# frozen_string_literal: true

module Mutations
  module Properties
    class CreateProperty < Mutations::BaseMutation
      argument :attributes, Attributes::Properties::PropertyAttributes, required: true
      field :property, Types::Properties::PropertyType, null: false

      def resolve(attributes: {})
        { property: ::Properties::PropertyCreator.new(current_user:, params: attributes.to_h).call }
      end
    end
  end
end
