# frozen_string_literal: true

module Users
  class UserCreator < BaseService
    attr_accessor :user

    def call
      ActiveRecord::Base.transaction do
        @user = User.new(params).tap(&:save!)
      end
    end
  end
end
