# frozen_string_literal: true

module Types
  module Enum
    module Users
      class StatusEnum < Types::BaseEnum
        User.statuses.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
