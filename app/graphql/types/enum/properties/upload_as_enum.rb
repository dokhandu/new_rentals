# frozen_string_literal: true

module Types
  module Enum
    module Properties
      class UploadAsEnum < Types::BaseEnum
        Property.upload_as.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
