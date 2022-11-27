# frozen_string_literal: true

module Attributes
  module Users
    class UserFilterAttributes < Types::BaseInputObject
      argument :role_id, ID, required: false
      argument :enabled, Boolean, required: false
      argument :status, Types::Enum::Users::StatusEnum, required: false
    end
  end
end
