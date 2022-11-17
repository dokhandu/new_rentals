# frozen_string_literal: true

module Attributes
  module PortalSettings
    class PortalSettingAttributes < Types::BaseInputObject
      argument :id, ID, required: false
      argument :dzongkhag, String, required: false
      argument :gewog, String, required: false
      argument :theme_colour, Types::Enum::PortalSettings::ThemeColourEnum, required: false
      argument :_destroy, Integer, required: false
    end
  end
end
