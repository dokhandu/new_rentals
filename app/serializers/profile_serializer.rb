# frozen_string_literal: true

class ProfileSerializer < ApplicationSerializer
  attributes(
    :id,
    :name
  )
end
