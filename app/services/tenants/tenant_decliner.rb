# frozen_string_literal: true

module Tenants
  class TenantDecliner < BaseService
    include TransitionCallbacks

    attr_accessor :tenant

    def call
      @tenant = Tenant.find_by(id: params[:id])

      ActiveRecord::Base.transaction do
        tenant.send(:rejecting)
        tenant.save!
      end

      post_transition
      true
    end

    private

    def post_transition
      send(:after_rejecting) if respond_to?(:after_rejecting)
    end
  end
end
