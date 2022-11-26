# frozen_string_literal: true

module Tenants
  class TenantDecliner < BaseService
    include TransitionCallbacks

    attr_accessor :tenant

    def call
      @tenant = Tenant.find_by(id: params[:id]).tap(&:rejecting)
      post_transition
      true
    end

    private

    def post_transition
      send(:after_rejecting) if respond_to?(:after_rejecting)
    end
  end
end

# Tenant.where(state: %i[received interviewing]).group_by(&:unit_id).each do |key, value|
#   nos = value.size
#   Unit.find(key).update!(nos_of_applicants: nos)
# end
