# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      def create
        creator = ::Users::UserCreator.new(params: registration_params)
        creator.call

        render json: UserSerializer.new(creator.user).serializable_hash.to_json
      end

      private

      def registration_params
        params.require(:user).permit(
          :email,
          :password,
          :password_confirmation,
          :role_id,
          :status,
          :enabled,
          profile: %i[
            full_name
            phone
            gender
          ],
          subscription_plan: [:name],
          portal_setting: %i[
            business_name
            dzongkhag
            gewog
            theme_colour
          ]
        )
      end
    end
  end
end
