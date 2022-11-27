# frozen_string_literal: true

module Resolver
  class BaseResolver
    include Assigner

    attr_accessor(
      :current_user,
      :offset_page,
      :limit_per_page,
      :sort,
      :direction,
      :query
    )

    def initialize(current_user:, params: {})
      @current_user = current_user
      assign_attributes(params)
    end

    def set_direction
      direction&.casecmp?('desc') ? :desc : :asc
    end
  end
end
