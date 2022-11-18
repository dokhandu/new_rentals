# frozen_string_literal: true

module Resolver
  class UsersResolver < BaseResolver
    attr_accessor :role_id, :enabled, :status, :query

    def call
      paginated_user
        .try { |users| filter_by_role(users) }
        .try { |users| filter_by_enabled(users) }
        .try { |users| filter_by_status(users) }
        .try { |users| search_user(users) }
    end

    private

    def paginated_user
      User.limit(limit_per_page).offset(offset_page)
    end

    def filter_by_role(users)
      return users if role_id.blank?

      users.where(role_id:)
    end

    def filter_by_enabled(users)
      return users if enabled.blank?

      user.where(enabled:)
    end

    def filter_by_status(users)
      return users if status.blank?

      users.send(status)
    end

    def search_user(users)
      return users if query.blank?

      users.joins(:profile)
           .where(
             "CONCAT_WS(
               ' ',
               users.email,
               profiles.full_name,
               profiles.phone
             )
             iLIKE ?",
             "%#{query}%"
           )
    end
  end
end
