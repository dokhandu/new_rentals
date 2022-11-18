# frozen_string_literal: true

class ProfileSerializer < ApplicationSerializer
  attributes(
    :id,
    :salutation,
    :name
  )
end
