# frozen_string_literal: true

module Tenants
  class TenantInterviewer < BaseService
    include TransitionCallbacks

    attr_accessor :tenant

    def call
      @tenant = Tenant.find_by(id: params[:id]).tap(&:processing).save!
      post_transition
      true
    end

    private

    def post_transition
      send(:after_processing) if respond_to?(:after_processing)
    end
  end
end
