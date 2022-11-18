# frozen_string_literal: true

NESTED_ATTRIBUTES = ActiveSupport::HashWithIndifferentAccess.new(
  YAML.safe_load(
    Rails.root.join('config/nested_attributes.yml').read
  )
).freeze

