# frozen_string_literal: true

module Types
  module Enum
    module Profiles
      class GenderEnum < Types::BaseEnum
        Profile.genders.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
