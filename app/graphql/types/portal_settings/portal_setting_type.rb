# frozen_string_literal: true

module Types
  module PortalSettings
    class PortalSettingType < BaseObject
      field :id, ID, null: false
      field :business_name, String, null: false
      field :dzongkhag, String, null: true
      field :gewog, String, null: true
      field :theme_colour, String, null: true
    end
  end
end
