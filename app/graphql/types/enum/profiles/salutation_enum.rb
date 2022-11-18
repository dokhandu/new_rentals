# frozen_string_literal: true

module Types
  module Enum
    module Profiles
      class SalutationEnum < Types::BaseEnum
        Profile.salutations.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
