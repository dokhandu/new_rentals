# frozen_string_literal: true

module Types
  module Enum
    module PortalSettings
      class ThemeColourEnum < Types::BaseEnum
        PortalSetting.theme_colours.each_key do |key|
          value key.to_s
        end
      end
    end
  end
end
