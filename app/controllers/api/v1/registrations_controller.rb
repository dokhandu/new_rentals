# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      def new
        creator = ::Users::UserCreator.new(params: registration_params)
        creator.call

        render json: UserSerializer.new(creator.user).serializable_hash.to_json
      end

      private

      def registration_params
        params.require(:user).permit(
          :email,
          :password
        )
      end
    end
  end
end
