# frozen_string_literal: true

class BaseController < ApplicationController
  PUBLIC = %w[properties].freeze
  before_action :authenticate_user!, if: -> { need_authentication? }

  def need_authentication?
    query_parse = GraphQL::Query.new(NewRentalsSchema, params[:query].to_s)
    PUBLIC.exclude?(query_parse.selected_operation&.selections[0].name)
  end
end
