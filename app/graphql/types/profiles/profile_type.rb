# frozen_string_literal: true

module Types
  module Profiles
    class ProfileType < BaseObject
      field :id, ID, null: false
      field :full_name, String, null: false
      field :phone, String, null: true
      field :gender, String, null: true
    end
  end
end
