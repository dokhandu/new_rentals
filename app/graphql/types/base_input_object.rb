# frozen_string_literal: true

module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument

    argument :offset_page, Integer, required: false
    argument :limit_per_page, Integer, required: false
  end
end
