# frozen_string_literal: true

module Resolver
  class BaseResolver
    include Assigner

    attr_accessor(
      :current_user,
      :offset_page,
      :limit_per_page
    )

    def initialize(current_user:, params: {})
      @current_user = current_user
      assign_attributes(params)
    end
  end
end
