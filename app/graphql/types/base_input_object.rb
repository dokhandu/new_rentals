# frozen_string_literal: true

module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument

    argument :offset_page, Integer, required: false
    argument :limit_per_page, Integer, required: false
    argument :sort, String, required: false, description: 'Note ~> Confirm with Backend For Correct Params'
    argument :direction, String, required: false, description: 'Default: asc, options: [:asc, :desc]'
  end
end
