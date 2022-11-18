# frozen_string_literal: true

class SubscriptionPlanSerializer < ApplicationSerializer
  attributes(
    :id,
    :business_name,
    :dzongkhag,
    :gewog,
    :theme_colour
  )
end
