# frozen_string_literal: true

module Resolver
  class UsersResolver < BaseResolver
    def call
      User.limit(limit_per_page).offset(offset_page)
    end
  end
end
