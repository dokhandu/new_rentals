# frozen_string_literal: true

module Users
  class UserUpdater < BaseService
    def call
      # ActiveRecord::Base.transaction do
      #   @user = User.new(params).tap(&:save!)
      # end
    end
  end
end
