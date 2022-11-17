# frozen_string_literal: true

module Types
  class RoleType < BaseObject
    field :id, ID, null: false
    field :role_name, String, null: false
  end
end