# frozen_string_literal: true

class BaseService
  include Assigner
  include AttributesFormatter

  attr_accessor :params, :current_user, :id

  def initialize(attributes = {})
    assign_attributes(attributes)
  end

  protected

  def execute
    yield
  rescue StandardError => e
    raise ::GraphQL::ExecutionError, e.message
  end
end
