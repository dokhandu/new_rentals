# frozen_string_literal: true

module Helpers
  module Tenant
    extend ActiveSupport::Concern

    def vacant?
      if unit.occupied?
        TenantMailer.notify_tenant_occupied(id).deliver_now
        update!(state: declined)
        false
      else
        true
      end
    end
  end
end
