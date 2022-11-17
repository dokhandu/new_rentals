# frozen_string_literal: true

module Attributes
  module Profiles
    class ProfileAttributes < Types::BaseInputObject
      argument :id, ID, required: false
      argument :full_name, String, required: false
      argument :phone, String, required: false
      argument :gender, Types::Enum::Profiles::GenderEnum, required: false
      argument :_destroy, Integer, required: false
    end
  end
end
