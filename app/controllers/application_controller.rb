# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ApiErrors::ErrorHandler
  include TimeZone
  include Responder

  respond_to :json
end
