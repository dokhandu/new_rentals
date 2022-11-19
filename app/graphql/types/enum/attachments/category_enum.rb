# frozen_string_literal: true

module Types
  module Enum
    module Attachments
      class CategoryEnum < Types::BaseEnum
        Attachment.categories.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
