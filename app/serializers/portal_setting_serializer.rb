# frozen_string_literal: true

class PortalSettingSerializer < ApplicationSerializer
  attributes(
    :id,
    :business_name,
    :dzongkhag,
    :gewog,
    :theme_colour
  )
end
