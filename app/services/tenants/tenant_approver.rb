# frozen_string_literal: true

module Tenants
  class TenantApprover < BaseService
    include TransitionCallbacks
    attr_accessor :tenant

    def call
      @tenant = Tenant.find_by(id: params[:id])
      return true if tenant.accepted?

      tenant.send(:approving)
      post_transition
      true
    end

    private

    def post_transition
      send(:after_approving) if respond_to?(:after_approving)
    end
  end
end
