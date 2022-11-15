# frozen_string_literal: true

module Responder
  private

  def respond_with(resource, _opts = {})
    if resource.is_a?(Hash)
      super
    elsif resource.errors.empty?
      render json: resource
    else
      invalid_resource(resource)
    end
  end
end
