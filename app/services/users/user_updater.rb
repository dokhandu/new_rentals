# frozen_string_literal: true

module Users
  class UserUpdater < BaseService
    def call
      User.find(params.delete('id')).tap do |user|
        user.update!(params)
      end
    end
  end
end
