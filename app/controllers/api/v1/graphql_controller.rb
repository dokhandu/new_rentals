# frozen_string_literal: true

module Api
  module V1
    class GraphqlController < BaseController
      include GraphqlHelpers
      # If accessing from outside this domain, nullify the session
      # This allows for outside API access while preventing CSRF attacks,
      # but you'll have to authenticate your users separately
      # protect_from_forgery with: :null_session

      def execute
        result = NewRentalsSchema.execute(
          query,
          variables:,
          context:,
          operation_name:
        )

        render json: result
      rescue StandardError => e
        raise e unless Rails.env.development?

        handle_error_in_development(e)
      end

      private

      def handle_error_in_development(e)
        logger.error e.message
        logger.error e.backtrace.join("\n")

        render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
      end
    end
  end
end
